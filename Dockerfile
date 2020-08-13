FROM alpine:latest

RUN apk --no-cache --no-progress add tzdata curl openvpn

COPY ./profiles /pia
WORKDIR /pia
COPY connect.sh /pia/connect.sh

ENV REGION="US Dallas"
ENV TZ="America/Chicago"
ENTRYPOINT ["/bin/sh","/pia/connect.sh"]
