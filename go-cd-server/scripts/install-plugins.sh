#!/bin/bash

cd /root

CHANGES=""
if [[ -e /root/plugins-list.txt ]]; then
  PLUGINS="$(cat /root/plugins-list.txt)"
  if ! [[ -z  "$PLUGINS" ]]; then
    mkdir -p /root/plugins
    for FILE in ${PLUGINS//\\n/ }; do
      if ! [[ -z "$FILE" ]]; then
        NAME="$(echo $FILE | awk 'BEGIN {FS=OFS="/"}{print $NF}')"
        if [[ "" != "$(echo $NAME | grep '5%2')" ]]; then
          NAME="$(echo $NAME | awk 'BEGIN {FS=OFS="5%2"}{print $NF}')"
        fi
        EXTENSION="$(echo $NAME | awk 'BEGIN {FS=OFS="."}{print $NF}' )"
        if ! [[ -e /root/plugins/$NAME ]]; then
          echo "Downloading plugin : $NAME (ext: $EXTENSION) ..."
          wget "$FILE" -O /root/plugins/$NAME
          CHANGES="1"
        else
          echo "Plugin : $NAME already installed!!"
        fi
      fi
    done
    if ! [[ -z "CHANGES" ]]; then
      echo "Refreshing plugin list ..."
      mkdir -p /usr/lib/go-server/plugins/external
      cp plugins/*.jar /usr/lib/go-server/plugins/external/
    else
      echo "No changes to plugins!!"
    fi
  else
    echo "No plugin in plugins file ..."
  fi
else
  echo "Plugins file not avaiable ..."
fi
