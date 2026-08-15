#!/usr/bin/env bash

MIC=$(pactl get-default-source)

if pactl get-source-mute "$MIC" | grep -q yes; then
    echo ""
else
    echo ""
fi
