#!/usr/bin/env bash

get_mic() {
    pactl get-default-source
}

print_status() {
    MIC=$(get_mic)

    muted=$(pactl get-source-mute "$MIC" | awk '{print $2}')
    volume=$(pactl get-source-volume "$MIC" | awk '{print $5}' | head -n1)

    if [ "$muted" = "yes" ]; then
        echo " $volume"
    else
        echo " $volume"
    fi
}

toggle() {
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
}

increase() {
    pactl set-source-volume @DEFAULT_SOURCE@ +5%
}

decrease() {
    pactl set-source-volume @DEFAULT_SOURCE@ -5%
}

case "$1" in
    --toggle)
        toggle
        ;;
    --increase)
        increase
        ;;
    --decrease)
        decrease
        ;;
    *)
        while true; do
            print_status
            sleep 1
        done
        ;;
esac
toggle() {
  MUTED=$(pacmd list-sources | awk '/\*/,EOF {print}' | awk '/muted/ {print $2; exit}')
  DEFAULT_SOURCE=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}')

  if [ "$MUTED" = "yes" ]; then
      pactl set-source-mute "$DEFAULT_SOURCE" 0
  else
      pactl set-source-mute "$DEFAULT_SOURCE" 1
  fi
}

increase() {
  DEFAULT_SOURCE=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}')
  pactl set-source-volume "$DEFAULT_SOURCE" +5%
}

decrease() {
  DEFAULT_SOURCE=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}')
  pactl set-source-volume "$DEFAULT_SOURCE" -5%
}

case "$1" in
    --toggle)
        toggle
        ;;
    --increase)
        increase
        ;;
    --decrease)
        decrease
        ;;
    *)
        listen
        ;;
esac
