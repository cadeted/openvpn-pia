#!/bin/sh

#remove default route 
/sbin/ip route del default

#capture VPN IP
ip="$(ifconfig | grep -A 1 'tun0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"
echo $ip > /pia/ip
