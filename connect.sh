#!/bin/sh
set -e -u -o pipefail

if [ -n "$REGION" ]; then
  set -- "$@" '--config' "${REGION}.ovpn"
fi

set -- "$@" '--auth-user-pass' 'auth.conf'

openvpn "$@"