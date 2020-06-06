FROM alpine:latest

RUN apk add --no-cache openvpn
COPY pia /pia
WORKDIR /pia
COPY connect.sh /usr/local/bin/connect.sh
RUN ["/bin/sh","-c", "chmod +x /user/local/bin/connect.sh"]

ENV REGION="US Texas"
ENTRYPOINT ["/user/local/bin/connect.sh"]
