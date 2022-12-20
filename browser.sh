#!/bin/sh
chromium-browser --display=:0 --kiosk --incognito --window-position=0,0 --force-device-scale-factor=1.5 --enable-logging=stderr --v=1 > log.txt 2>&1 --autoplay-policy=no-user-gesture-required https://wieting.tamatoledo.com/pre-show
