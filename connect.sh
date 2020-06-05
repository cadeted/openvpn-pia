#!/bin/sh
set -e -u -o pipefail

if [ -n "$REGION" ]; then
  set -- "$@" '--config' "${REGION}.ovpn"
fi

if [ ! -z "$USERNAME" ]; then
  echo "$USERNAME" > auth.conf
  echo "$PASSWORD" >> auth.conf
fi
set -- "$@" '--auth-user-pass' 'auth.conf'

openvpn "$@"