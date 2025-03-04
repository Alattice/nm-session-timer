#!/bin/sh
SESSION_FILE="/mnt/onboard/.adds/session_timer/timed_session"
if [ -f "$SESSION_FILE" ]; then
    # File exists, read stored timestamp
    stored_time=$(cat "$SESSION_FILE")
    current_time=$(date +%s)
    time_diff=$((current_time - stored_time))
    # Less than 24 hours, calculate difference
    hours=$((time_diff / 3600))
    minutes=$(((time_diff % 3600) / 60))
    if [ $hours -eq 0 ]; then
        echo "Session lasted ${minutes}mins"
    else
        echo "Session lasted ${hours}hours & ${minutes}mins"
    fi
    rm $SESSION_FILE
else
    echo "No session was started"
fi
