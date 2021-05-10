# TM4C129X Ethernet Bootloader

In order to get the TM4C129X working with firmware update over ethernet, three pieces are involved:
(some stuff is also described here: http://www.ti.com/lit/ug/spmu301d/spmu301d.pdf)

1. Get the booloader on the client device
2. Setup the server-side bootloader
3. Server side app and eflash to start BOOTP process

## Things you'll need
- Code Composer Studio 6.0.0 and above
- Tivaware 2.1.3.156
- `boot_emac_flash` example from Tivaware
- `boot_demo_emac_flash` example from Tivaware
- `blinky.bin` example blinky app from Tivaware

## 1. Get The bootloader on the device : `boot_emac_flash`

The first step is to make sure that this will be deployed at the beginning of flash. So go ahead and adapt in `bl_emac.c` the port definitions according to: https://github.com/kroesche/stellaris_eflash, i.e, add 40000 to all port numbers to be non-priveliged ports. Create `PORT_OFFSET` in `bl_emac.c`

```c
#define PORT_OFFSET             40000 // JLK
```

Then set the `BOOTP_SERVER_PORT` that you'll connect to, and the `BOOTP_CLIENT_PORT`, and the `TFTP_PORT` to all be offset by the `PORT_OFFSET`
```c
#define BOOTP_SERVER_PORT       (67 + PORT_OFFSET)
#define BOOTP_CLIENT_PORT       (68 + PORT_OFFSET)
#define TFTP_PORT               (69 + PORT_OFFSET)
```

Also edit the `uip_.c` to also have `PORT_OFFSET` added to it
```c
uip_udp_conn->rport == HTONS(40000+69)) && \
```

Then include the local copy of `uip.c` which has been modified to be used instead
```c
#include "<Your_TivaWare_Root>/third_party/uip-1.0/uip/uip_.c"
```


In `bl_config.h`, set stellaris as the `ENET_BOOTP_SERVER`:
```c
#define ENET_BOOTP_SERVER       "stellaris"
```

Then, debug on CCS or use a tool like `lm4flash` or Uniflash to flash the `boot_emac_flash` on to the device.

## 2. Get The example app: `boot_demo_emac_flash` on the device.

`boot_demo_emac_flash` is going to help you jump to the bootloader from the app itself to prep the device to update it's firmware. The first thing to do is to set the correct address so you don't overwrite the `boot_emac_flash` that you uploadedMake sure to `#define APP_BASE 0x00004000` for the program app. so that it does not interfere with the bootloader's memory layout in flash. Also make sure that when running in CCS, check Run Debug configuration and choose erase flash only in certain range:

```c
start = 0x00004000
```
and set the length of the program to `0001c884` (in used column of `.map` file)

```c
//(using hex calculator): http://www.csgnetwork.com/hexaddsubcalc.html
end   = 0x00020884
```

Then make sure that when something happens (like a button press or a magic packet comes in) that the code will initiate jumping to the bootloader with a code structure like this in `boot_demo_emac_flash.c`:

```c
SoftwareUpdateInit(SoftwareUpdateRequestCallback);

while(!g_bFirmwareUpdate) // this will be left when the magic packet arrives.
{
  // do stuff
}

SoftwareUpdateBegin(g_ui32SysClock); // Transfer control to the bootloader.
```

Finally, make sure that in `SoftwareUpdateInit` we can receive from any IP address the magic packet:  
```c
udp_bind(g_psMagicPacketPCB, IP_ADDR_ANY, MPACKET_PORT);
```

## 3 Make a push from the server "eflash" to initiate the BOOTP process
https://github.com/kroesche/stellaris_eflash .. for MAC

Create an additional socket to `sBOOTP` in order to send the `BOOTP` reply. sBOOTP still does the `recvfrom` for the `BOOTP` request from the bootloader.

First, compile:
```bash
gcc -o eflash bootp_server.c eflash.c
```
Then you can run eflash to push blinky on to your device:
```
./eflash -i 192.168.22.109 --mac 00:1a:b6:00:00:01 -l 192.168.22.1 blinky.bin --verbose
```
That will initiate the `BOOTP` process by tapping up `SoftwareUpdateBegin` which should then send the image via TFTPCheck to make sure that it is the right device name when verifying the BOOTP packet. (it can be `tiva` or `stelaris`) so :`(strcasecmp(pPacket->pcSName, "stellaris")`.


## Future work:

- get things less hardcoded, i.e., in the bootloader figure out IP address based on bay-ids. set the server IPs, etc.
- when going to the KP: internal/external PHY. (if run on LED board. in tiva lib use `PHY_USE_INTERNAL    0.`)
- having an automated way to send enet updates to a range of IP addresses
- get feedback if success or not

## Tricks to debug:

- When in assembly mode, go to run debug config. load symbols only. (make sure not to terminate when loading/ or reset). ok to stop current debug session.
- Use Wireshark (https://www.wireshark.org/)
- Double check all ports: client & server
- Get UniFlash (http://www.ti.com/tool/UNIFLASH)
- Use UniFlash to check MAC addresses
- Use UniFlash to check that the bootloader is correctly at beginning of flash
