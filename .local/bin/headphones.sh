#!/usr/bin/env bash

CARD="bluez_card.B0_F0_0C_48_53_FD"

echo "Waiting for Bluetooth headset..."

# Wait for device to appear
for i in {1..15}; do
    pactl list cards short | grep -q "$CARD" && break
    sleep 1
done

if ! pactl list cards short | grep -q "$CARD"; then
    echo "Headset not found"
    exit 0
fi

echo "Forcing A2DP (AAC)..."

# Force A2DP AAC profile
pactl set-card-profile "$CARD" a2dp-sink

# 🔁 HARD VERIFY LOOP
for i in {1..20}; do
    ACTIVE=$(pactl list cards | awk -v card="$CARD" '
        $0 ~ card {found=1}
        found && /Active Profile:/ {print $3; exit}
    ')

    echo "Current profile: $ACTIVE"

    if [ "$ACTIVE" = "a2dp-sink" ]; then
        echo "A2DP confirmed"
        exit 0
    fi

    sleep 1
done

echo "WARNING: A2DP not confirmed, continuing anyway"
exit 0
