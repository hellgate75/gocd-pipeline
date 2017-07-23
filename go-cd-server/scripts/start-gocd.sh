#!/bin/bash
RUNNING="$(ps -eaf| grep go-server|grep -v grep|grep -v tail)"

if [[ -z "$RUNNING" ]]; then
  cd /usr/lib/go-server && ./server.sh
  sleep 2
  ps -eaf| grep go-server|grep -v grep | awk 'BEGIN {FS=OFS=" "}{print $2}' > /usr/lib/go-server/go-server.pid
  echo "GoCD Server stated!!"
else
  echo "GoCD Server already running!!"
fi
