FROM alpine:latest

#install required packages
RUN apk --no-cache --no-progress add tzdata curl openvpn bmon

#copy over pia profiles to docker FS
COPY ./profiles /pia
WORKDIR /pia

#connection script to handle env variables and openvpn arguments
COPY connect.sh /pia/connect.sh

#default vpnm config to use if not part of docker creation
ENV REGION="us_east"

#healthcheck for vpn tunnel up
HEALTHCHECK --interval=60s --timeout=15s CMD curl -L 'https://api.ipify.org'

ENTRYPOINT ["/bin/sh","/pia/connect.sh"]
