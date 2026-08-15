#!/usr/bin/env bash

chosen=$(printf "󰒲 Hibernate\n Logout\n Reboot\n Shutdown" \
| rofi -dmenu \
-theme ~/.config/rofi/powermenu.rasi \
-p "Power")

case "$chosen" in
    *Hibernate)
        systemctl hibernate
        ;;
    *Logout)
        i3-msg exit
        ;;
    *Reboot)
        systemctl reboot
        ;;
    *Shutdown)
        systemctl poweroff
        ;;
esac
