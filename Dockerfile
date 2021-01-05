FROM alpine:latest

RUN apk --no-cache --no-progress add tzdata curl openvpn
RUN apk --no-cache --no-progress add bmon

COPY ./profiles /pia
WORKDIR /pia
COPY *.sh /pia/

ENV REGION="US Texas"
ENV TZ="America/Chicago"

HEALTHCHECK --interval=1m --timeout=5s CMD /pia/check.sh
ENTRYPOINT ["/bin/sh","/pia/connect.sh"]
