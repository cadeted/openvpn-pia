#!/bin/sh
set -e -u -o pipefail

if [ -n "$REGION" ]; then
  set -- "$@" '--config' "./${REGION}.ovpn"
fi

if  [ -n "${USERNAME:-}" ] &&  [ -n "${PASSWORD:-}" ]; then
	echo "Using Environment Variables for credentials"
	echo ${USERNAME} > ./auth2.conf
	echo ${PASSWORD} >> ./auth2.conf
	set -- "$@" '--auth-user-pass' '/pia/auth2.conf'
else
	echo "Using passed auth.conf file for credentials"
	set -- "$@" '--auth-user-pass' '/pia/auth.conf'
fi

openvpn "$@"
