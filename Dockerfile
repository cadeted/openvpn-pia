FROM alpine:latest

RUN apk add --no-cache openvpn
COPY ./profiles /pia
WORKDIR /pia
COPY connect.sh /pia/connect.sh
RUN ["/bin/sh","-c", "chmod +x /pia/connect.sh"]

ENV REGION="US Texas"
ENV TZ="America/Chicago"
ENTRYPOINT [". /pia/connect.sh"]

