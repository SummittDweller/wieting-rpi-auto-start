# kiosk

The `kiosk` shell script pulled from the Raspberry Pi pre-show kiosk device on 4-Dec-2022.  
The following added to the script on 20-Dec-2022 to try and capture a log (~/chrome_debug.log) of chromium behavior:  
  `--enable-logging=stderr --v=1 > log.txt 2>&1`

`pi@raspberrypi:~ $ cat kiosk`

```sh
#!/bin/sh
xset -dpms     # disable DPMS (Energy Star) features.
xset s off     # disable screen saver
xset s noblank # don't blank the video device
matchbox-window-manager -use_titlebar no &
unclutter &    # hide X mouse cursor unless mouse activated
cvlc --random /home/pi/music-tracks &
chromium-browser --display=:0 --kiosk --incognito --window-position=0,0 --force-device-scale-factor=1.5 --enable-logging=stderr --v=1 > log.txt 2>&1  --autoplay-policy=no-user-gesture-required https://wieting.tamatoledo.com/pre-show
```
