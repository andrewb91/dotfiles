#!/bin/bash

# start conky
conky &

# wait for conky window
for i in {1..20}; do
    WIN_ID=$(xdotool search --name "conky" 2>/dev/null | head -n 1)
    [ ! -z "$WIN_ID" ] && break
    sleep 0.01
done

# give conky time to render bars
sleep 0.1

# start offscreen (left)
xdotool windowmove $WIN_ID -350 100

# slide in
for i in {-350..0..20}; do
    xdotool windowmove $WIN_ID $i 100
    sleep 0.01
done

# stay visible
sleep 10

# slide out
for i in {0..-350..-20}; do
    xdotool windowmove $WIN_ID $i 100
    sleep 0.01
done

killall conky
