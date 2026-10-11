#!/usr/bin/env bash

INTERNAL="eDP-1"
EXTERNAL="HDMI-A-1"

case "$1" in
    internal)
        hyprctl keyword monitor "$EXTERNAL,disable"
        hyprctl keyword monitor "$INTERNAL,1920x1200@60.0,0x0,1"
        ;;

    external)
        hyprctl keyword monitor "$INTERNAL,disable"
        hyprctl keyword monitor "$EXTERNAL,1920x1200@60.0,0x0,1"
        ;;

    toggle)
        if hyprctl monitors | grep -q "^Monitor $EXTERNAL"; then
            # HDMI active -> switch to laptop
            hyprctl keyword monitor "$EXTERNAL,disable"
            hyprctl keyword monitor "$INTERNAL,1920x1200@60.0,0x0,1"
        else
            # Laptop active -> switch to HDMI
            hyprctl keyword monitor "$INTERNAL,disable"
            hyprctl keyword monitor "$EXTERNAL,1920x1200@60.0,0x0,1"
        fi
        ;;

    *)
        echo "Usage: $0 {internal|external|toggle}"
        exit 1
        ;;
esac
