#!/bin/bash

if ! [[  -z "$(echo $3|grep "\-daemon")" ]]; then
  echo "Running docker start GoCD Agent ..."
  chmod 777 /docker-start-gocd.sh
  /docker-start-gocd.sh -daemon
else
  echo "Executing command : $@"
  exec "$@"
fi
