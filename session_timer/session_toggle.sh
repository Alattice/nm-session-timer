#!/bin/sh
SESSION_FILE="/mnt/onboard/.adds/nm-session-timer/timed_session"
readable_date=$(date +"%l:%M%p")
if [ ! -f "$SESSION_FILE" ]; then
    # File doesn't exist, create it with current time
    date +%s > "$SESSION_FILE"
    echo "Session started at $readable_date"
elif [ -f "$SESSION_FILE" ]; then
    # File exists, read stored timestamp
    stored_time=$(cat "$SESSION_FILE")
    current_time=$(date +%s)
    time_diff=$((current_time - stored_time))
    if [ $time_diff -gt 86400 ]; then
        # More than 24 hours (86400 seconds), overwrite with current time
        date +%s > "$SESSION_FILE"
        echo "Session started at $readable_date"
    else
        # Less than 24 hours, calculate difference
        hours=$((time_diff / 3600))
        minutes=$(((time_diff % 3600) / 60))
        if [ $hours -eq 0 ]; then
            echo "Session lasted ${minutes}mins"
        else
            echo "Session lasted ${hours}hours & ${minutes}mins"
        fi
        rm $SESSION_FILE
    fi
fi
