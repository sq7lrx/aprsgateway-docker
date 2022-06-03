FROM alpine AS builder

RUN apk add --update \
    make \
    git \
    g++ \
    && rm -rf /var/cache/apk/* \
    && git clone https://github.com/g4klx/APRSGateway.git src \
    && cd /src && make -j$(nproc)
    

FROM alpine

RUN apk add --update libstdc++ libgcc && rm -rf /var/cache/apk/*

RUN mkdir -p /conf
COPY --from=builder /src/APRSGateway /usr/bin
COPY --from=builder /src/APRSGateway.ini /etc/APRSGateway.ini.sample

EXPOSE 8673/udp

LABEL org.opencontainers.image.authors="Adam SQ7LRX <sq7lrx@lavabs.com>" \
      org.opencontainers.image.url="https://github.com/sq7lrx/aprsgateway-docker" \
      org.opencontainers.image.source="https://github.com/sq7lrx/aprsgateway-docker" \
      org.opencontainers.image.title="APRSGateway" \
      org.opencontainers.image.description="Ham Radio APRSGateway software by G4KLX" \
      org.opencontainers.image.vendor="SQ7LRX"

CMD ["/usr/bin/APRSGateway"]
