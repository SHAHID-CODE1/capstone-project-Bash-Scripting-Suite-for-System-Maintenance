#!/usr/bin/env bash
LOG=${1:-"/var/log/syslog"}
FILTER=${2:-""}
if [ ! -f "$LOG" ]; then
  echo "Log file not found: $LOG"
  exit 1
fi
echo "Monitoring $LOG (Ctrl+C to stop)"
if [ -n "$FILTER" ]; then
  tail -F "$LOG" | grep --line-buffered -i "$FILTER"
else
  tail -F "$LOG"
fi
