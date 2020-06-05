FROM alpine:latest

RUN apk add --no-cache openvpn
COPY pia /pia
WORKDIR /pia
COPY connect.sh /pia/connect.sh

ENV REGION="US Texas"
ENTRYPOINT /pia/connect.sh
