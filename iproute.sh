#!/bin/sh
#
# Enable local network connections to the container if LOCAL_NETWORK is set

echo "Sleeping 15 secs"
sleep 15  # Ensure tunnel creation is complete
echo "Using $LOCAL_NETWORK as local network"
echo "Using $1 as local network"

### Allow Local Network connections
if [ -n "${LOCAL_NETWORK}" ]; then
    eval "$(ip r l | grep -v 'tun0\|kernel'|awk '{print "GW="$3"\nINT="$5}')"
    ip route add "$LOCAL_NETWORK" via "$GW" dev "$INT"
    echo "$LOCAL_NETWORK" via "$GW" dev "$INT"
elif [ -n "$1" ]; then
    eval "$(ip r l | grep -v 'tun0\|kernel'|awk '{print "GW="$3"\nINT="$5}')"
    ip route add "$1" via "$GW" dev "$INT"
    echo "$1" via "$GW" dev "$INT"
else
    echo "No local network defined, not adding IP route"
fi
echo "Done"
