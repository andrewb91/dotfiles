#!/usr/bin/env bash

SSID=$(iwgetid -r)
IP=$(hostname -I | awk '{print $1}')
SIGNAL=$(iw dev wlan0 link | grep signal | awk '{print $2}')

notify-send "Wi-Fi Info" "SSID: $SSID
IP: $IP
Signal: $SIGNAL dBm"
