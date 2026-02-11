#! /usr/bin/env sh

#checks for external monitor
if hyprctl monitors | grep -q 'eDP-1'; then
	if [[ "$1"== "close" ]]; then
		# Disable laptop screen when lid is closed
		hyprctl keyword monitor "eDP-1, disable"
	elif [["$1" == "open" ]]; then
		# Enable laptop if open
		hyprctl keyword monitor "eDP-1,1920x1200@60.0,1920x0,1.0,bitdepth,10"
		fi
fi
