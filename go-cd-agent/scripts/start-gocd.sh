#!/bin/bash
RUNNING="$(ps -eaf| grep go-agent|grep -v grep|grep -v tail)"

if [[ -z "$RUNNING" ]]; then
  cd /usr/lib/go-agent && ./agent.sh
  sleep 2
  ps -eaf| grep go-agent|grep -v grep | awk 'BEGIN {FS=OFS=" "}{print $2}' > /usr/lib/go-agent/go-agent.pid
  echo "GoCD Agent stated!!"
else
  echo "GoCD Agent already running!!"
fi
