#!/bin/bash

RUNNING="$(ps -eaf| grep go-server|grep -v grep|grep -v tail)"
DAEMON_COMMAND="-daemon"

function setupSystemFiles() {
  if ! [[ -z "$GOCD_FILE_URL" ]]; then
    download-system-file-gocd
    install-system-file-gocd
  fi
}

if [[ -z "$RUNNING" ]]; then


  if ! [[ -z "$PLUGIN_FILE_URL" ]]; then
    if ! [[ -e /root/plugins-list.txt ]]; then
      download-plugins-index-gocd
    fi
    if [[ -e /root/plugins-list.txt ]]; then
      if ! [[ -e /root/plugins ]]; then
        echo "First GoCD Server plugin initialization ..."
        start-gocd
        sleep 10
        stop-gocd
        echo "GoCD Server plugin installation ..."
        install-plugins-gocd
      else
        echo "Checking GoCD Server plugin status ..."
        install-plugins-gocd
      fi
      setupSystemFiles
    else
      echo "Unable to install plugins!!"
    fi
    echo "Starting GoCD Server ..."
    start-gocd
    if [[ "$1" == "$DAEMON_COMMAND" ]]; then
      echo "GoCD Server status : "
      status-gocd
      tail -f  /var/log/go-server/go-server.out.log
    fi
  else
    setupSystemFiles
    start-gocd
    if [[ "$1" == "$DAEMON_COMMAND" ]]; then
      echo "GoCD Server status : "
      status-gocd
      tail -f  /var/log/go-server/go-server.out.log
    fi
  fi
fi

echo "GoCD Server status : "
status-gocd

if [[ "$1" == "$DAEMON_COMMAND" ]]; then
  echo "Entering in sleep mode!!"
  tail -f /dev/null
elif [[ $# -gt 1 ]]; then
  echo "Executing command :  ${@:1:${#}}"
  exec  ${@:1:${#}}
else
  echo "Nothing to do, quitting ..."
fi
