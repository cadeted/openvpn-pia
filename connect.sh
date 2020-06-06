#!/bin/sh
set -e -u -o pipefail

if [ -n "$REGION" ]; then
  set -- "$@" '--config' "./${REGION}.ovpn"
fi

if  [ -n "${USERNAME:-}" ] &&  [ -n "${PASSWORD:-}" ]; then
	echo ${USERNAME} > ./auth.conf
	echo ${PASSWORD} >> ./auth.conf
fi

set -- "$@" '--auth-user-pass' '/pia/auth.conf'

openvpn "$@"
