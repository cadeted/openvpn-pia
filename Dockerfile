FROM alpine:latest

RUN apk --no-cache --no-progress add tzdata curl openvpn
RUN apk --no-cache --no-progress add bmon

COPY ./profiles /pia
WORKDIR /pia
COPY connect.sh /pia/connect.sh
COPY up.sh /pia/up.sh

RUN chmod +x /pia/up.sh

ENV REGION="US Texas"
ENV TZ="America/Chicago"

HEALTHCHECK --interval=15m --timeout=3s CMD curl -f ipinfo.io/ip || exit 1
ENTRYPOINT ["/bin/sh","/pia/connect.sh"]
