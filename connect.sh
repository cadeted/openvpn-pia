#!/bin/sh
set -e -u -o pipefail

if [ -n "$REGION" ]; then
  set -- "$@" '--config' "./profiles/${REGION}.ovpn"
fi

set -- "$@" '--auth-user-pass' '/pia/auth.conf'

openvpn "$@"