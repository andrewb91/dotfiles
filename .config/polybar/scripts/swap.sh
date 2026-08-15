#!/usr/bin/env bash

total=$(grep SwapTotal /proc/meminfo | awk '{print $2}')
free=$(grep SwapFree /proc/meminfo | awk '{print $2}')

used=$((total-free))

if [ "$total" -eq 0 ]; then
    echo "SWAP 0%"
    exit
fi

percent=$((used*100/total))

echo "SWAP ${percent}%"
