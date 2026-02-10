#!/usr/bin/env bash

# Get the first RUNNING sink
ACTIVE_SINK=$(pactl list short sinks | awk '$7 == "RUNNING" {print $1; exit}')

# If a running sink was found, set it as default
if [[ -n "$ACTIVE_SINK" ]]; then
    pactl set-default-sink "$ACTIVE_SINK"

    # Move existing audio streams to the new default sink
    pactl list short sink-inputs | awk '{print $1}' | while read -r INPUT; do
        pactl move-sink-input "$INPUT" "$ACTIVE_SINK"
    done
fi
