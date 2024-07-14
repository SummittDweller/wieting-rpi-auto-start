# kiosk-wieting-pre-show  

Documenting the Wieting Theatre's RPI (_Raspberry Pi_) pre-show auto-start **kiosk** config.  


**Attention**: Use an `Alt-F4` keystroke combination to stop the kiosk and get back to a command prompt.  

The _Raspberry Pi_ is a model `3B+` running _Raspbian Lite_ `Bullseye` with its kiosk configuration per [Configure a Raspberry Pi as a kiosk display](https://reelyactive.github.io/diy/pi-kiosk/).  

As of 19-Jan-2022 there is a second _Raspberry Pi_, this one a model `4B+` _Raspbian Lite_ `Bullseye` with its kiosk configuration matching the original config mentioned above.  


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

### 14-Jul-2024

- Old RPI in the booth failed with 3 bad memory blocks.  Using the procedure at https://objsal.medium.com/raspberry-pi-backup-restore-from-macos-57c376937a3a to back that Micro SD card up to /Volumes/iMac500GB.
- I have my newer Raspberry Pi 4B+ working (video only thus far) here at home and will install it in the booth later today.
- Updated the "new" RPI 4B+ and installed VLC per https://groups.google.com/g/reading-hackspace/c/VJYb4x9LH8w?pli=1.
- Using the procedure at https://objsal.medium.com/raspberry-pi-backup-restore-from-macos-57c376937a3a to back the new Micro SD card up to /Volumes/iMac500GB/wieting-preshow-rpi-backup.img.gz.

### 20-Dec-2022

- Added Chromium logging to `kiosk` as documented in the attached `kiosk` script.
- Added my Chromium lanuch command to a new `browser.sh` script, and
- Added crontab specification to run the new `browser.sh` script every 10 minutes.

### 2-Dec-2022

- Something in the system, either the _chromium_ kiosk or the `/pre-show` Javascript in the website appears to stop showing images after about 15 minutes.

- Mackenzie and I looked a the `~/kiosk` script this evening but didn't see anything there that would equate to a 15-minute timer.  I need to look at the `/pre-show` Javascript to be sure there's no limit there.  

### 15-Apr-2022

- Mackenzie managed to get the kiosk to simultaneously play .mp4 tracks at random, and I set the website `/pre-show` to play only 15-second clips with NO accompanying audio.  This works nicely now that we've secured plenty of appropriate, royalty-free music tracks from Cat Campbell Currier. 

- The new .mp4 tracks are stored on the Raspberry Pi for playback, and that playback starts automatically when the unit boots up.

- The `--force-device-scaling-factor=1.333` option added to the _chromium_ kiosk startup command in the `~/kiosk` file no longer appears to be working?  :frowning:

### 30-Jan-2022

- Making a record of the `pi` user password on the Wieting's Raspberry Pi.  `Alt-F4` works to interrupt playback and get to a terminal prompt from the keybaord.  `ssh pi@10.0.0.41` also works from the Mac Mini in the booth.

- Added a `--force-device-scaling-factor=1.333` to the _chromium_ kiosk startup command in the `~/kiosk` file on the Wieting's Raspberry Pi.  It works!

### 28-Jan-2022

- Tasked Mackenzie with creating and classifying more 15- and 30-second audio clips.

### 21-Jan-2022

- Adding more 30-second, and longer, audio clips and working to convert one or two of our ads into the new `pre-show` format.  

- Need to try and introduce .mp4 playback within the new `pre-show` scheme.  Also looking to briefly try and extract .mp4 video from a DCP package.  _No DCP extraction but I got .mp4 playback working nicely!_

### 20-Jan-2022

- There's a new `dyanmic-timing` branch of the [Wieting website code](https://github.com/SummittDweller/wieting-one-click-cms) dedicated to implementing variable timing of clips played at https://Wieting.TamaToledo.com/pre-show.  

- In addition to adding `dynamic-timing` I'd also like to investigate rotating the video output 90-degrees.  See the last half of [Rotating the screen for the Raspberry Pi 4](https://pimylifeup.com/raspberry-pi-rotate-screen/) for a possible solution.  

- Giving up on the `dynamic-timing` approach since manipulating the `setInterval` and `setTimeout` functions in Javascript looks dicey.  Instead, I've settled on the approach of using multiple `pre-show` objects, each 15-seconds long, to handle objects that need multiple screens or longer durations.

### 19-Jan-2022

- Last evening I formatted my only other micro SD card, 16 GB capacity, with _Raspbian Lite_ `Bullseye` so that Mackenzie can configure it to match the setup of the `3B+` that is documented above.  

- It was NOT possible to restore the backup mentioned above to this 16 GB card since the backup is of a 32 GB image.  

- The 16 GB card has been installed in a pristine _Raspberry Pi_ `4B+` where it is ready for configuration.  

- Configuration is complete.  It works!  

- Now making a backup of the 16 GB micro SD card using the same process as before: `sudo dd if=/dev/disk4 of=/Users/mark/kiosk-wieting-pre-show.dmg`

- Renaming this repository and document from `wieting-rpi-auto-start` to `kiosk-wieting-pre-show`.

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
