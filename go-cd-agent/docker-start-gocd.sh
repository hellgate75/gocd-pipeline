#!/bin/bash

RUNNING="$(ps -eaf| grep go-agent|grep -v grep)"
DAEMON_COMMAND="-daemon"
echo "PARAM1=$1"

if [[ -z "$RUNNING" ]]; then
  if [[ $GO_AGENT_STARTUP_DELAY -gt 0 ]]; then
    echo "GoCD Agent waiting delay of $GO_AGENT_STARTUP_DELAY seconds ..."
    sleep $GO_AGENT_STARTUP_DELAY
    echo "GoCD Agent continue startup ..."
  fi
  start-gocd-agent
  if [[ "$1" == "$DAEMON_COMMAND" ]]; then
    echo "GoCD Agent status : "
    status-gocd-agent
    tail -f /usr/lib/go-agent/logs/go-agent-launcher.log
  fi
fi

echo "GoCD Agent status : "
status-gocd-agent

if [[ "$1" == "$DAEMON_COMMAND" ]]; then
  echo "Entering in sleep mode!!"
  tail -f /dev/null
elif [[ $# -gt 1 ]]; then
  echo "Executing command :  ${@:1:${#}}"
  exec  ${@:1:${#}}
else
  echo "Nothing to do, quitting ..."
fi
