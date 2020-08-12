#!/usr/bin/env sh
#
# Enable local network connections to the container if LOCAL_NETWORK is set

sleep 15  # Ensure tunnel creation is complete

### Allow Local Network connections
if [ -n "${LOCAL_NETWORK}" ]; then
    eval "$(ip r l | grep -v 'tun0\|kernel'|awk '{print "GW="$3"\nINT="$5}')"
    ip route add "$LOCAL_NETWORK" via "$GW" dev "$INT"
fi
