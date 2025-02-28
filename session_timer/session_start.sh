#!/bin/sh
SESSION_FILE="/mnt/onboard/.adds/session_timer/timed_session"
readable_date=$(date +"%l:%M%p")
if [ -f "$SESSION_FILE" ]; then
    rm $SESSION_FILE
date +%s > "$SESSION_FILE"
echo "Session started at $readable_date"
fi