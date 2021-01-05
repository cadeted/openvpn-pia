#!/bin/sh

ip="$(ifconfig | grep -A 1 'tun0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"
echo $ip > /pia/ip
