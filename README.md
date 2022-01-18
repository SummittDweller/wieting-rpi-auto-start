# wieting-rpi-auto-start  

Documenting the Wieting Theatre's RPI (Raspberry Pi) pre-show auto-start KIOSK config.  


**Attention**: Use an `Alt-F4` keystroke combination to stop the kiosk and get back to a command prompt.  

The Raspberry Pi is a model `3B+` running _Raspbian Lite_ `Bullseye` with its kiosk configuration per [Configure a Raspberry Pi as a kiosk display](https://reelyactive.github.io/diy/pi-kiosk/).  

### 17-Jan-2022  

- Found the key to media `autoplay` at https://stackoverflow.com/questions/49921453/how-to-allow-video-autoplay-in-a-google-chrome-kiosk-app-in-version-66-or-later.  Added `--autoplay-policy=no-user-gesture-required` to the `chromium-browser` statement in `~/kiosk` and it works!

- Ok, I fixed some things in the site's code and now it works beautifully!

- Made a new backup on my Mac Mini using `sudo dd if=/dev/disk4 of=/Users/mark/wieting-rpi-auto-start.dmg`

### 16-Jan-2022  

- The kiosk is working nicely EXCEPT there is apparently no HTML audio output via the HDMI port.

- The 32 GB micro SD card was backed up to my MacBook Pro per [How to Back Up and Restore Your Raspberry Pi SD Card on Mac](https://howchoo.com/pi/create-a-backup-image-of-your-raspberry-pi-sd-card-in-mac-osx).
  - Find the micro SD using `diskutil list`
  - `sudo dd if=/dev/disk2 of=/Users/mark/wieting-kiosk-no-audio.dmg`

- To get Chromium audio working try: `chromium-browser --disable-features=AudioServiceSandbox`.  Nope.


  
 
