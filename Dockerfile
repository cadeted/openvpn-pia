FROM alpine:latest

RUN apk add --no-cache openvpn
WORKDIR /pia
COPY connect.sh /usr/local/bin/connect.sh
RUN ["/bin/sh","-c", "chmod +x /usr/local/bin/connect.sh"]

ENV REGION="US Texas"
ENTRYPOINT ["connect.sh"]
