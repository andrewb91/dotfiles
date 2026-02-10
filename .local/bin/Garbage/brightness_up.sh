#!/bin/bash
 brightnessctl --device='tpacpi::kbd_backlight' set 2
 echo 2 > /sys/class/leds/tpacpi::kbd_backlight/brightness
