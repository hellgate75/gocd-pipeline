#!/bin/bash

cd /root
CHANGES=""
if [[ -e /root/systemfiles-list.txt ]]; then
  SYSTEMFILES="$(cat /root/systemfiles-list.txt)"
  if ! [[ -z  "$SYSTEMFILES" ]]; then
    mkdir -p /root/plugins
    for FILE in ${SYSTEMFILES//\\n/ }; do
      if ! [[ -z "$FILE" ]]; then
        REMOTE_NAME="$(echo $FILE | awk 'BEGIN {FS=OFS="="}{print $1}')"
        LOCAL_NAME="$(echo $FILE | awk 'BEGIN {FS=OFS="="}{print $2}')"
        echo "Downloading sytem file : $REMOTE_NAME (to local: $LOCAL_NAME) ..."
        wget "$REMOTE_NAME" -O $LOCAL_NAME
        CHANGES="1"
      fi
    done
    if ! [[ -z "CHANGES" ]]; then
      echo "Applied multiple configurations ..."
    else
      echo "No changes to Go CD system files!!"
    fi
  else
    echo "No system files in Go Continuous Deivery system file list ..."
  fi
else
  echo "Go Continuous Delivery system file list not avaiable ..."
fi
