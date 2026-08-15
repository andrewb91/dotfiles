#!/usr/bin/env bash
TEAM="COL"
team_icon="󰑃"
TEAM_COLOR="#6F263D"   # Avalanche primary color

while true; do
    # Fetch games from yesterday / today / tomorrow
    game=$(jq -c --arg TEAM "$TEAM" '
      [
        inputs.gameWeek[].games[]
        | select(.awayTeam.abbrev==$TEAM or .homeTeam.abbrev==$TEAM)
      ]
      |
      (
        map(select(.gameState == "LIVE"))[0] //
        map(select(.gameState == "CRIT"))[0] //
        (map(select(.gameState == "FINAL" or .gameState == "OFF"))
         | sort_by(.gameDate // .startTimeUTC) | last) //
        map(select(.gameState == "PRE" or .gameState == "FUT"))[0]
      )
    ' \
    <(curl -s "https://api-web.nhle.com/v1/schedule/$(date -d yesterday +%Y-%m-%d)") \
    <(curl -s "https://api-web.nhle.com/v1/schedule/$(date +%Y-%m-%d)") \
    <(curl -s "https://api-web.nhle.com/v1/schedule/$(date -d tomorrow +%Y-%m-%d)"))

    if [[ -z "$game" || "$game" == "null" ]]; then
        echo ""
        sleep 300
        continue
    fi

    # Extract basic info
    gameId=$(echo "$game" | jq -r '.id // .gameId')
    away=$(echo "$game" | jq -r '.awayTeam.abbrev')
    home=$(echo "$game" | jq -r '.homeTeam.abbrev')
    away_score=$(echo "$game" | jq -r '.awayTeam.score // 0')
    home_score=$(echo "$game" | jq -r '.homeTeam.score // 0')
    state=$(echo "$game" | jq -r '.gameState')

    # Matchup string
    if [[ "$away" == "$TEAM" ]]; then
        matchup=" @ ${home}"
    else
        matchup=" vs ${home}"
    fi

    # ==================== TIME WINDOW ====================
    game_time=$(echo "$game" | jq -r '.startTimeUTC')
    if [[ -n "$game_time" ]]; then
        game_start_epoch=$(date -d "$game_time" +%s 2>/dev/null)
        game_end_epoch=$(( game_start_epoch + 9000 ))   # ~2.5 hours
        show_before=$(( game_start_epoch - 7200 ))      # 2 hours before
        hide_after=$(( game_end_epoch + 21600 ))        # 6 hours after

        now=$(date +%s)

        if [[ "$state" != "LIVE" && "$state" != "CRIT" ]]; then
            if [[ "$now" -lt "$show_before" || "$now" -gt "$hide_after" ]]; then
                echo ""
                sleep 300
                continue
            fi
        fi
    fi
    # ====================================================

    # Enhanced live data (better for OT/SO/Intermission)
    period_num="" period_type="" clock="" intermission=false
    if [[ "$state" == "LIVE" || "$state" == "CRIT" ]] && [[ -n "$gameId" ]]; then
        detail=$(curl -s "https://api-web.nhle.com/v1/gamecenter/$gameId/landing")
        period_num=$(echo "$detail" | jq -r '.periodDescriptor.number // empty')
        period_type=$(echo "$detail" | jq -r '.periodDescriptor.periodType // empty')
        clock=$(echo "$detail" | jq -r '.clock.timeRemaining // empty')
        intermission=$(echo "$detail" | jq -r '.clock.inIntermission // false')
    else
        period_num=$(echo "$game" | jq -r '.periodDescriptor.number // empty')
        clock=$(echo "$game" | jq -r '.clock.timeRemaining // empty')
        intermission=$(echo "$game" | jq -r '.clock.inIntermission // false')
    fi

    # Build time/status string
    if [[ "$intermission" == "true" ]]; then
        time_str="INT"
    elif [[ "$period_type" == "OT" || "$period_num" == "4" ]]; then
        time_str="OT ${clock:-}"
    elif [[ "$period_type" == "SO" ]]; then
        time_str="SO"
    elif [[ -n "$period_num" && -n "$clock" ]]; then
        time_str="P${period_num} ${clock}"
    elif [[ -n "$period_num" ]]; then
        time_str="P${period_num}"
    else
        time_str=""
    fi

    # Final output using only COL primary color
    case "$state" in
        LIVE|CRIT)
            echo "$team_icon %{F$TEAM_COLOR}$away $away_score - $home_score $home%{F-} $time_str"
            sleep 15
            ;;
        FINAL|OFF)
            if [[ "$period_type" == "SO" ]]; then
                final_str="SO"
            elif [[ "$period_type" == "OT" || "$period_num" == "4" ]]; then
                final_str="OT"
            else
                final_str="FINAL"
            fi
            echo "$team_icon %{F$TEAM_COLOR}$away $away_score - $home_score $home%{F-} $final_str"
            sleep 300
            ;;
        *)
            # Preview / upcoming
            echo "$team_icon %{F$TEAM_COLOR}$TEAM%{F-}${matchup}"
            sleep 60
            ;;
    esac
done
