#!/bin/sh

#get tunnel IP
tun_ip=$(cat /pia/ip)
#capture current IP
ip="$(ifconfig | grep -A 1 'tun0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"

if  [ $tun_ip == $ip ]; then
  exit 0
else
  exit 1
fi



