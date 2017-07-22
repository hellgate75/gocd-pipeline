#!/bin/bash

RUNNING="$(ps -eaf| grep go-server|grep -v grep)"

echo "COMMAND=$3"

if [[ "$3" == "-daemon" ]]; then
  echo "Running docker start GoCD Server ..."
  /docker-start-gocd.sh -daemon
else
  echo "Executing command : $@"
  exec $@
fi
