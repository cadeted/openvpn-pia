#!/bin/sh
set -e -u -o pipefail

#set config file first
if [ -n "$REGION" ]; then
  set -- "$@" '--config' "./${REGION}.ovpn"
fi

#echo what PIA region is being used -- based on env variable
echo "Connecting to ${REGION}"

#set auth commands -- either passed auth.conf or env variables
if  [ -n "${USERNAME:-}" ] &&  [ -n "${PASSWORD:-}" ]; then
	echo "Using Environment Variables for credentials"
	echo ${USERNAME} > ./auth2.conf
	echo ${PASSWORD} >> ./auth2.conf
	set -- "$@" '--auth-user-pass' '/pia/auth2.conf'
else
	echo "Using passed auth.conf file for credentials"
	set -- "$@" '--auth-user-pass' '/pia/auth.conf'
fi

#set other options/overwrite config files
set -- "$@" '--auth-nocache'
set -- "$@" '--status' '/var/log/openvpn.status'

#set up script to add local network route
set -- "$@" '--up' '/usr/local/bin/up.sh'

#run openvpn
openvpn "$@"
