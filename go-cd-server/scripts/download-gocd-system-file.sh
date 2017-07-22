#!/bin/bash
RUNNING="$(ps -eaf| grep go-server|grep -v grep)"

cd /root

PROTOCOL="$(echo $GOCD_FILE_URL | awk 'BEGIN {FS=OFS="://"}{print $1}')"

if [[ "file" == "PROTOCOL" ]]; then
  FILE_NAME="$(echo $GOCD_FILE_URL | awk 'BEGIN {FS=OFS="://"}{print $2}')"
  echo "GOCD FILE TRANSFER - PATH : $FILE_NAME to /root/systemfiles-list.txt"
  if [[ -e $FILE_NAME ]]; then
    cp $FILE_NAME /root/systemfiles-list.txt
  else
    echo "GOCD FILE TRANSFER - UNABLE TO FIND FILE IN MOUNTED FILE PATH : $FILE_NAME!!"
  fi
else
  echo "GOCD URL TRANFER : $GOCD_FILE_URL to /root/systemfiles-list.txt"
  wget "$GOCD_FILE_URL" -O /root/systemfiles-list.txt
  if [[ "0" == "$?" ]]; then
    echo "GOCD URL TRANFER : $GOCD_FILE_URL SUCCESS!!"
  else
    echo "GOCD URL TRANFER : $GOCD_FILE_URL FAILED!!"
  fi
fi
