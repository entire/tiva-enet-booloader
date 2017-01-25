# TM4C129X Ethernet Bootloader

In order to get the DK-TM4C129X working with enet updates, three apps are involved:
(some stuff is also described here: http://www.ti.com/lit/ug/spmu301d/spmu301d.pdf)

1. Get the booloader on the client device
2. Setup the server-side bootloader
3. Server side app and eflash to start BOOTP process

### Requirements
- Code Composer Studio 6.0.0 and above
= Tivaware SK-DKok 2.1.3.156

### 1. Get The bootloader on the device : `boot_emac_flash`

The first step is to make sure that this will be deployed at the beginning of flash. So go ahead and adapt in `bl_emac.c` the port definitions according to: https://github.com/kroesche/stellaris_eflash by @kroesche, i.e, add 40000 to all port numbers to be non-priveliged ports. Create `PORT_OFFSET` in `bl_emac.c`

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
uip_udp_conn->rport == HTONS(40000+69)) &&
```

Then include the local copy of `uip.c` which has been modified to be used instead
```c
#include "/Users/robert/Downloads/SW-TM4C-2.1.3.156/third_party/uip-1.0/uip/uip_.c"
```


In `bl_config.h`, set stellaris as the `ENET_BOOTP_SERVER`:
```c
#define ENET_BOOTP_SERVER       "stellaris"
```

Make sure to set an IP address statically in `bl_emac.c` (we have no DHCP server) and set it after `uip_udp_new`
```c
uip_ipaddr_t addrh;
uip_ipaddr(&addrh, 192,168,22,109);
uip_sethostaddr(&addrh);
```

Now double check all ports: client & server and run

### 2.The example app on the device. which jumps to the bootloader if something happens (like a button press or a magic packet comes in)

Make sure to have a code structure like this:

```c
SoftwareUpdateInit(SoftwareUpdateRequestCallback);

while(!g_bFirmwareUpdate) // this will be left when the magic packet arrives.
{
  // do stuff
}

SoftwareUpdateBegin(g_ui32SysClock); // Transfer control to the bootloader.
```

Make sure to `#define APP_BASE 0x00004000` for the program app. so that it does not interfere with the bootloader's memory layout in flash. Also make sure to when running in CCS. Go to Run Debug configuration, and choose erase flash only in certain range:

```c
start = 0x00004000
```
and set the length of the program to `0001c884` (in used column of `.map` file)

```c
//(using hex calculator): http://www.csgnetwork.com/hexaddsubcalc.html
end   = 0x00020884
```

Finally, make sure that in `SoftwareUpdateInit` we can receive from any IP address the magic packet:  
```c
udp_bind(g_psMagicPacketPCB, IP_ADDR_ANY, MPACKET_PORT);
```

### 3 The server app "eflash" to start the BOOTP process and then send the image via TFTP
https://github.com/kroesche/stellaris_eflash .. for MAC

Create an additional socket to `sBOOTP` in order to send the `BOOTP` reply. sBOOTP still does the `recvfrom` for the `BOOTP` request from the bootloader.

First, compile:
```bash
gcc -o eflash bootp_server.c eflash.c
```
Then run:
```
./eflash -i 192.168.22.109 --mac 00:1a:b6:00:00:01 -l 192.168.22.1 blinky.out --verbose
```
Check to make sure that it is the right device name when verifying the BOOTP packet. (it can be "tiva" or "stelaris"):  `(strcasecmp(pPacket->pcSName, "stellaris")`.


### Future work:

- get things less hardcoded, i.e., in the bootloader figure out IP address based on bay-ids. set the server IPs, etc.
- when going to the KP: internal/external PHY.
(if run on LED board. in tiva lib use `PHY_USE_INTERNAL    0.`)
- having an automated way to send enet updates to a range of IP addresses
- get feedback if success or not

### Tricks to debug:

- When in assembly mode, go to run debug config. load symbols only. (make sure not to terminate when loading/ or reset). ok to stop current debug session.
- Use Wireshark (https://www.wireshark.org/)
- Double check all ports: client & server
- Get UniFlash (http://www.ti.com/tool/UNIFLASH)
- Use UniFlash to check Mac addresses
- Use UniFlash to check that the bootloader is correctly at beginning of flash
