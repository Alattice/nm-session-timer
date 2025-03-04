#!/bin/sh
SESSION_FILE="/mnt/onboard/.adds/session_timer/timed_session"
if [ -f "$SESSION_FILE" ]; then
    stored_time=$(cat "$SESSION_FILE")
    echo "Session already started at $stored_time"
else
    readable_date=$(date +"%l:%M%p")
    date +%s > "$SESSION_FILE"
    echo "Session started at $readable_date"
fi