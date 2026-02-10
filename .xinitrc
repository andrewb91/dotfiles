#!/bin/sh

# Execute:

#sxhkd &
#numlockx &
#ufw &
#nm-applet &
#xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 1920x1200 &
#xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 3840x2160 --rate 50 --scale .7x.7 &
#~/.fehbg &

# turn off Display Power Management Service (DPMS)
xset -dpms
setterm -blank 0 -powerdown 0

# turn off black Screensaver
xset s off

exec i3
#exec openbox

