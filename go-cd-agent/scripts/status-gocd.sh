#!/bin/bash
RUNNING="$(ps -eaf| grep go-agent|grep -v grep)"

if [[ -z "$RUNNING" ]]; then
  echo "GoCD Agent is NOT running!!"
else
  echo "GoCD Agent is running!!"
fi
