#!/usr/bin/env bash
#Take a Screenshot
scrot /tmp/screen.png
#Pixelate the Screenshot
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
#Add Lock image, I think
convert /tmp/screen.png ~/.dotfiles/lock.png -gravity center -composite -matte /tmp/screen.png
#Lock the screen with the image.
i3lock -u -i /tmp/screen.png
#Remove temp image.
rm /tmp/screen.png
#Turn the screen off after a 60 second delay.
#I pulled this from some forum, but I don't think it cares if pgrep returns true
#or not...

#sleep 50; pgrep i3lock && xset dpms force off
