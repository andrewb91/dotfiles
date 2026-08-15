#!/usr/bin/env bash

CACHE="$HOME/.cache/polybar_weather"
mkdir -p "$CACHE"

LOC_FILE="$CACHE/coords"
DISPLAY_FILE="$CACHE/location"

# ---- Get location once (or if missing) ----
if [ ! -f "$LOC_FILE" ]; then
    data=$(curl -s --max-time 4 https://ipinfo.io/json)

location=$(cat "$DISPLAY_FILE")    coords=$(echo "$data" | jq -r '.loc')
    city=$(echo "$data" | jq -r '.city')
    region=$(echo "$data" | jq -r '.region')

    # fallback
    if [ -z "$coords" ] || [ "$coords" = "null" ]; then
        coords="33.83,-117"
        city="Anaheim"
        region="CA"
    fi

    echo "$coords" > "$LOC_FILE"
    echo "${city}, ${region}" > "$DISPLAY_FILE"
fi

coords=$(cat "$LOC_FILE")
location=$(cat "$DISPLAY_FILE")
# When traveling, type:  rm -rf ~/.cache/polybar_weather
USE_MANUAL=true
if [ "$USE_MANUAL" = true ]; then
    coords="33.83,-117.91"
    location="Anaheim, CA"
fi
lat=$(echo "$coords" | cut -d',' -f1)
lon=$(echo "$coords" | cut -d',' -f2)

# ---- Fetch weather (Open-Meteo) ----
weather=$(curl -s --max-time 4 \
"https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${lon}&current_weather=true&temperature_unit=fahrenheit")

temp=$(echo "$weather" | jq -r '.current_weather.temperature')

# ---- Weather code → icon mapping ----
code=$(echo "$weather" | jq -r '.current_weather.weathercode')

case "$code" in
    0) icon="󰖙" ;;                         # Clear
    1|2) icon="󰖕" ;;                      # Partly cloudy
    3) icon="󰖐" ;;                        # Cloudy
    45|48) icon="󰖑" ;;                    # Fog
    51|53|55|56|57) icon="󰖖" ;;          # Drizzle
    61|63|65|66|67) icon="󰖗" ;;          # Rain
    71|73|75|77) icon="󰖘" ;;             # Snow
    80|81|82) icon="󰖗" ;;                # Rain showers
    95|96|99) icon="󰖓" ;;                # Thunderstorm
    *) icon="󰖐" ;;
esac

# ---- Output ----
echo "$icon ${temp}°F  $location"
