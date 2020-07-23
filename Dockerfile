FROM alpine:latest

RUN apk add --no-cache openvpn
RUN apk add tzdata
RUN apk add curl
COPY ./profiles /pia
WORKDIR /pia
COPY *.sh /pia/
#RUN ["/bin/sh","-c","chmod +x /pia/connect.sh"]

ENV REGION="US Texas"
ENV TZ="America/Chicago"
ENTRYPOINT ["/bin/sh","/pia/connect.sh"]

