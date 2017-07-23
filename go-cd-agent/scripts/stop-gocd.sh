#!/bin/bash
RUNNING="$(ps -eaf| grep go-agent|grep -v grep|grep -v tail)"

if ! [[ -z "$RUNNING" ]]; then
  cd /usr/lib/go-agent && ./stop-agent.sh
  rm -f /usr/lib/go-agent/go-agent.pid
  echo "GoCD Agent stopped!!"
else
  echo "GoCD Agent not running!!"
fi
