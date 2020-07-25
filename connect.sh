#!/bin/sh
set -e -u -o pipefail

set -- "$@" '--status' '/var/log/openvpn.status' 

if [ -n "$REGION" ]; then
  set -- "$@" '--config' "./${REGION}.ovpn"
fi

echo "Connecting to ${REGION}"

if  [ -n "${USERNAME:-}" ] &&  [ -n "${PASSWORD:-}" ]; then
	echo "Using Environment Variables for credentials"
	echo ${USERNAME} > ./auth2.conf
	echo ${PASSWORD} >> ./auth2.conf
	set -- "$@" '--auth-user-pass' '/pia/auth2.conf'
else
	echo "Using passed auth.conf file for credentials"
	set -- "$@" '--auth-user-pass' '/pia/auth.conf'
fi

set -- "$@" '--auth-nocache'

set -- "$@" '--ping' '30'

set -- "$@" '--management' 'localhost' '7088'

openvpn "$@"
