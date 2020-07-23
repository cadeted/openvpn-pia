#!/bin/sh

CHANNEL="#notification"
USERNAME="Automaton"
MSG=$*

PAYLOAD="payload={\"channel\": \"$CHANNEL\", \"username\": \"$USERNAME\", \"text\": \"$MSG\"}"
HOOK=$SLACK

curl -X POST --data-urlencode "$PAYLOAD" "$HOOK"

exit 0