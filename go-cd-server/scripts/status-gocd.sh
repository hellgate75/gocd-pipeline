#!/bin/bash
RUNNING="$(ps -eaf| grep go-server|grep -v grep|grep -v tail)"

if [[ -z "$RUNNING" ]]; then
  echo "GoCD Server is NOT running!!"
else
  echo "GoCD Server is running!!"
fi
