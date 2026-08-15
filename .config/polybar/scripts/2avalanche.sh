#!/usr/bin/env bash

TEAM="COL"

while true; do

    # ---- Get most recent game (yesterday, today, tomorrow) ----
    game=$(jq -c --arg TEAM "$TEAM" '
  [
    inputs.gameWeek[].games[]
    | select(.awayTeam.abbrev==$TEAM or .homeTeam.abbrev==$TEAM)
  ]
  |
  (
    # 1. LIVE game (highest priority)
    map(select(.gameState == "LIVE"))[0] //

    # 2. Game in progress but not marked LIVE (edge cases)
    map(select(.gameState == "CRIT"))[0] //

    # 3. Most recent finished game
    (map(select(.gameState == "FINAL" or .gameState == "OFF"))
     | sort_by(.gameDate)
     | last) //

    # 4. Pre-game today (only if nothing else)
    map(select(.gameState == "PRE"))[0]
  )
' \
<(curl -s "https://api-web.nhle.com/v1/schedule/$(date -d yesterday +%Y-%m-%d)") \
<(curl -s "https://api-web.nhle.com/v1/schedule/$(date +%Y-%m-%d)") \
<(curl -s "https://api-web.nhle.com/v1/schedule/$(date -d tomorrow +%Y-%m-%d)"))

    # ---- No game → hide module ----
    if [ -z "$game" ] || [ "$game" = "null" ]; then
        echo ""
        sleep 300
        continue
    fi

    # ---- Extract data ----
    away=$(echo "$game" | jq -r '.awayTeam.abbrev')
    home=$(echo "$game" | jq -r '.homeTeam.abbrev')

    away_score=$(echo "$game" | jq -r '.awayTeam.score // ""')
    home_score=$(echo "$game" | jq -r '.homeTeam.score // ""')

    state=$(echo "$game" | jq -r '.gameState')
    
    # Pull period and time remaining (LIVE only)
period=$(echo "$game" | jq -r '.periodDescriptor.number // empty')
period_ordinal=$(echo "$game" | jq -r '.periodDescriptor.ordinal // empty')
clock=$(echo "$game" | jq -r '.clock // empty')
    
# ---------------------------------------------------
# TIME WINDOW: show only 2h before → 6h after game
# ---------------------------------------------------

# Extract game timestamp
game_time=$(echo "$game" | jq -r '.startTimeUTC')
# Example format: "2024-10-12T01:00:00Z"

# Convert to seconds since epoch (local timezone safe)
game_start_epoch=$(date -d "$game_time" +%s)

# Game ends ~2.5 hours after start
game_end_epoch=$(( game_start_epoch + 9000 ))   # 2.5 hours (2h 30m)

# Time windows
show_before=$(( game_start_epoch - 7200 ))      # 2 hours before start
hide_after=$(( game_end_epoch + 21600 ))        # 6 hours after end

now=$(date +%s)

# Hide outside window EXCEPT when LIVE
if [ "$state" != "LIVE" ]; then
    if [ "$now" -lt "$show_before" ] || [ "$now" -gt "$hide_after" ]; then
        echo ""
        continue
    fi
fi

    # ---- NHL team colors ----
    team_color() {
        case "$1" in
            ANA) echo "#F47A38" ;;
            ARI) echo "#8C2633" ;;
            BOS) echo "#FFB81C" ;;
            BUF) echo "#003087" ;;
            CGY) echo "#C8102E" ;;
            CAR) echo "#CC0000" ;;
            CHI) echo "#CF0A2C" ;;
            COL) echo "#6F263D" ;;
            CBJ) echo "#002654" ;;
            DAL) echo "#006847" ;;
            DET) echo "#CE1126" ;;
            EDM) echo "#041E42" ;;
            FLA) echo "#041E42" ;;
            LAK) echo "#111111" ;;
            MIN) echo "#154734" ;;
            MTL) echo "#AF1E2D" ;;
            NSH) echo "#FFB81C" ;;
            NJD) echo "#CE1126" ;;
            NYI) echo "#00539B" ;;
            NYR) echo "#0038A8" ;;
            OTT) echo "#C52032" ;;
            PHI) echo "#F74902" ;;
            PIT) echo "#FFB81C" ;;
            SEA) echo "#001628" ;;
            SJS) echo "#006D75" ;;
            STL) echo "#002F87" ;;
            TBL) echo "#002868" ;;
            TOR) echo "#00205B" ;;
            VAN) echo "#00205B" ;;
            VGK) echo "#B4975A" ;;
            WSH) echo "#041E42" ;;
            WPG) echo "#041E42" ;;
            UTA) echo "#6F263D" ;;
            *) echo "#FFFFFF" ;;
        esac
    }

    away_color=$(team_color "$away")
    home_color=$(team_color "$home")

    team_icon="󰑃"

    # ---- Output ----
# ---- Extra game info ----
period=$(echo "$game" | jq -r '.periodDescriptor.number // empty')
clock=$(echo "$game" | jq -r '.clock.timeRemaining // empty')
intermission=$(echo "$game" | jq -r '.clock.inIntermission // false')

# Build time string
if [ -n "$period" ] && [ -n "$clock" ]; then
    if [ "$intermission" = "true" ]; then
        time_str="INT"
    else
        time_str="P${period} ${clock}"
    fi
else
    time_str=""
fi

case "$state" in

    LLIVE)
    # Format: COL 3–2 MIN  •  2nd 12:33
    if [ -n "$clock" ] && [ -n "$period_ordinal" ]; then
        status="$period_ordinal $clock"
    else
        status="LIVE"
    fi

    echo "$team_icon %{F$away_color}$away $away_score%{F-} - %{F$home_color}$home_score $home%{F-}  $status"
    ;;
esac

done
