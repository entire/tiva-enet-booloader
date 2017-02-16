# bootloader over ethernet for kittypilot

This is the bootloader over ethernet for kittypilot. This is activated for use for firmware update of kittypilot over ethernet. This is not the "boot_eth" app that switches over to the bootloader.

In order to get the DK-TM4C129X working with enet updates, three apps are involved:
(some stuff is also described here: http://www.ti.com/lit/ug/spmu301d/spmu301d.pdf)

1. Get the booloader on the client device
2. Setup the server-side bootloader
3. Server side app and eflash to start BOOTP process

## Things you'll need
- Code Composer Studio 6.0.0 and above
- Tivaware 2.1.3.156
- `boot_emac_flash` example from Tivaware
- `boot_demo_emac_flash` example from Tivaware
- `blinky.out` example blinky app from Tivaware


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
- Use UniFlash to check Mac addresses
- Use UniFlash to check that the bootloader is correctly at beginning of flash
