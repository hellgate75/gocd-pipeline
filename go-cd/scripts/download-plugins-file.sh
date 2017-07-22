#!/bin/bash
RUNNING="$(ps -eaf| grep go-server|grep -v grep)"

cd /root

PROTOCOL="$(echo $PLUGIN_FILE_URL | awk 'BEGIN {FS=OFS="://"}{print $1}')"

if [[ "file" == "PROTOCOL" ]]; then
  FILE_NAME="$(echo $PLUGIN_FILE_URL | awk 'BEGIN {FS=OFS="://"}{print $2}')"
  echo "FILE TRANSFER - PATH : $FILE_NAME to /root/plugins-list.txt"
  if [[ -e $FILE_NAME ]]; then
    cp $FILE_NAME /root/plugins-list.txt
  else
    echo "FILE TRANSFER - UNABLE TO FIND FILE IN MOUNTED FILE PATH : $FILE_NAME!!"
  fi
else
  echo "URL TRANFER : $PLUGIN_FILE_URL to /root/plugins-list.txt"
  wget "$PLUGIN_FILE_URL" -O /root/plugins-list.txt
  if [[ "0" == "$?" ]]; then
    echo "URL TRANFER : $PLUGIN_FILE_URL SUCCESS!!"
  else
    echo "URL TRANFER : $PLUGIN_FILE_URL FAILED!!"
  fi
fi
