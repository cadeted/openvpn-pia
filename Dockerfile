FROM alpine:latest

RUN apk --no-cache --no-progress add tzdata curl openvpn bmon

COPY ./profiles /pia
WORKDIR /pia
COPY connect.sh /pia/connect.sh

ENV REGION="US Texas"
ENV TZ="America/Chicago"

HEALTHCHECK --interval=60s --timeout=15s CMD curl -L 'https://api.ipify.org'
ENTRYPOINT ["/bin/sh","/pia/connect.sh"]
