# wieting-rpi-auto-start
Documenting the Wieting Theatre's RPI (Raspberry Pi) pre-show auto-start KIOSK config.

**Attention**: Use an `Alt-F4` keystroke combination to stop the kiosk and get back to a command prompt.

The Raspberry Pi is a model `3B+` running _Raspbian Lite_ `Bullseye` with its kiosk configuration per [Configure a Raspberry Pi as a kiosk display](https://reelyactive.github.io/diy/pi-kiosk/).

### 16-Jan-2022
- The kiosk is working nicely EXCEPT there is apparently no HTML audio output via the HDMI port.
- The 32 GB micro SD card was backed up to my MacBook Pro per [How to Back Up and Restore Your Raspberry Pi SD Card on Mac](https://howchoo.com/pi/create-a-backup-image-of-your-raspberry-pi-sd-card-in-mac-osx).
  - Find the micro SD using `diskutil list`
  - `sudo dd if=/dev/disk2 of=/Users/mark/wieting-kiosk-no-audio.dmg`
 
