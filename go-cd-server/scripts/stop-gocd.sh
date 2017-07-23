#!/bin/bash
RUNNING="$(ps -eaf| grep go-server|grep -v grep|grep -v tail)"

if ! [[ -z "$RUNNING" ]]; then
  cd /usr/lib/go-server && ./stop-server.sh
  rm -f /usr/lib/go-server/go-server.pid
  echo "GoCD Server stopped!!"
else
  echo "GoCD Server not running!!"
fi
