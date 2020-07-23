#!/bin/sh

#if Slack webhook not defined, exit
if [ -z $SLACK ]; then
  exit 0
fi

MSG=$*

PAYLOAD="payload={\"text\": \"$MSG\"}"
HOOK=$SLACK

curl -X POST --data-urlencode "$PAYLOAD" "$HOOK"

exit 0