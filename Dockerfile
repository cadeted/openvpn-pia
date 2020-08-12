FROM alpine:latest

RUN apk --no-cache --no-progress add tzdata curl openvpn
RUN printf '#!/usr/bin/env sh\n/usr/local/bin/iproute.sh &\n' > /usr/local/bin/up.sh && \
    chmod +x /usr/local/bin/up.sh
COPY ./profiles /pia
WORKDIR /pia
COPY connect.sh /pia/connect.sh
COPY iproute.sh /usr/local/bin/iproute.sh
RUN chmod +x /usr/local/bin/iproute.sh

ENV REGION="US Dallas"
ENV TZ="America/Chicago"
ENTRYPOINT ["/bin/sh","/pia/connect.sh"]

