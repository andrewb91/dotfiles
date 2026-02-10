#!/bin/bash

touchpad_id=$(xinput --list |awk '/Touchpad/ {print $5}' | tr -d 'id=')
tapping_id=$xinput --list-props $touchpad_id | awk '/libinput Tap Action \(/ {print $4}' | tr -d '():')

# Enable Tapping
xinput --set-prop $touchpad_id $tapping_id 1
