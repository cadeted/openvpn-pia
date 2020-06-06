FROM alpine:latest

RUN apk add --no-cache openvpn
COPY ./profiles /pia
WORKDIR /pia
COPY connect.sh /usr/local/bin/connect.sh
RUN ["/bin/sh","-c", "chmod +x /usr/local/bin/connect.sh"]

ENV REGION="US Texas"
ENV TZ="America/Chicago"
#ENTRYPOINT [". /usr/local/bin/connect.sh"]
ENTRYPOINT ["/bin/sh -c . /usr/local/bin/connect.sh"]
