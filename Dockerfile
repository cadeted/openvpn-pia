FROM alpine:latest

RUN apk --no-cache --no-progress add tzdata curl openvpn
RUN printf '#!/bin/sh\n/pia/iproute.sh $LOCAL_NETWORK\n' > /usr/local/bin/up.sh && \
    chmod +x /usr/local/bin/up.sh
COPY ./profiles /pia
WORKDIR /pia
COPY connect.sh /pia/connect.sh
COPY iproute.sh /pia/iproute.sh
RUN chmod +x /pia/iproute.sh

ENV REGION="US Dallas"
ENV TZ="America/Chicago"
ENTRYPOINT ["/bin/sh","/pia/connect.sh"]

