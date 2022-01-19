# kiosk-wieting-pre-show  

Documenting the Wieting Theatre's RPI (_Raspberry Pi_) pre-show auto-start **kiosk** config.  


**Attention**: Use an `Alt-F4` keystroke combination to stop the kiosk and get back to a command prompt.  

The _Raspberry Pi_ is a model `3B+` running _Raspbian Lite_ `Bullseye` with its kiosk configuration per [Configure a Raspberry Pi as a kiosk display](https://reelyactive.github.io/diy/pi-kiosk/).  

## First Steps

Before you can work through the [Configure a Raspberry Pi as a kiosk display](https://reelyactive.github.io/diy/pi-kiosk/) procedure it may be necessary to do the following:

  - Power-up the _Raspberry Pi_ while connected to a keyboard, mouse, display and Ethernet.  After a minute or two you should see a command prompt on the display.

  - Run `Raspbian's` command line configuration tool by entering `sudo raspi-config`. In the configuration tool find and set the following:

    - Set the timezone to `America` and `Chicago`.
    - Set the wireless LAN country to `US`.
    - Set the keyboard to `Generic 105-key` and layout to `US`.
    - Enable `ssh` access.
    - Change the `pi` user password from the default (`raspberry`) to something more secure.

  - Reboot if/when prompted to do so.

  - After booting back up login to the terminal as user `pi` with the new password.

  - Find the device's local IP address using `sudo ipconfig`.  Look for the assigned IP address, probably of the form `192.168.0.x`.  Make a note of this address.


## Complete Setup via `ssh`

I find it easiest to complete the remaining setup steps by connecting to the device from my Mac using `ssh`.  That way I can have access to this document and other resources on the Mac AND have the ability to copy/paste from the Mac to the Raspberry Pi terminal.

To connect:  `ssh pi@192.168.0.x`, repeating the IP address obtained above.

## History

### 16-Jan-2022  

- The kiosk is working nicely EXCEPT there is apparently no HTML audio output via the HDMI port.

- The 32 GB micro SD card was backed up to my MacBook Pro per [How to Back Up and Restore Your Raspberry Pi SD Card on Mac](https://howchoo.com/pi/create-a-backup-image-of-your-raspberry-pi-sd-card-in-mac-osx).
  - Find the micro SD using `diskutil list`
  - `sudo dd if=/dev/disk2 of=/Users/mark/wieting-kiosk-no-audio.dmg`  


- To get Chromium audio working try: `chromium-browser --disable-features=AudioServiceSandbox`.  Nope.

### 17-Jan-2022  

- Found the key to media `autoplay` at https://stackoverflow.com/questions/49921453/how-to-allow-video-autoplay-in-a-google-chrome-kiosk-app-in-version-66-or-later.  Added `--autoplay-policy=no-user-gesture-required` to the `chromium-browser` statement in `~/kiosk` and it works!

- Ok, I fixed some things in the site's code and now it works beautifully!

- Made a new backup on my Mac Mini using `sudo dd if=/dev/disk4 of=/Users/mark/wieting-rpi-auto-start.dmg`

### 19-Jan-2022

- Last evening I formatted my only other micro SD card, 16 GB capacity, with _Raspbian Lite_ `Bullseye` so that Mackenzie can configure it to match the setup of the `3B+` that is documented above.  

- It was NOT possible to restore the backup mentioned above to this 16 GB card since the backup is of a 32 GB image.  

- The 16 GB card has been installed in a pristine _Raspberry Pi_ `4B+` where it is ready for configuration.  

- Configuration is complete.  It works!  

- Now making a backup of the 16 GB micro SD card using the same process as before: `sudo dd if=/dev/disk4 of=/Users/mark/kiosk-wieting-pre-show.dmg`

- Renaming this repository and document from `wieting-rpi-auto-start` to `kiosk-wieting-pre-show`.


  
 
