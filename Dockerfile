FROM alpine:latest

RUN apk add --no-cache openvpn
RUN apk add tzdata
RUN apk add curl
COPY ./profiles /pia
WORKDIR /pia
COPY connect.sh /pia/connect.sh

ENV REGION="US Dallas"
ENV TZ="America/Chicago"
ENTRYPOINT ["/bin/sh","/pia/connect.sh"]

