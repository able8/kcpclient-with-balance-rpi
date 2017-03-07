FROM hypriot/rpi-alpine-scratch:v3.4

ENV PEN_VER 0.34.1
ENV PEN_URL http://siag.nu/pub/pen/pen-$PEN_VER.tar.gz
ENV PEN_DIR pen-$PEN_VER
ENV PEN_DEP build-base gcc make

ENV KCP_VER 20170303
ENV KCP_URL https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-arm-$KCP_VER.tar.gz

RUN apk update && \
    apk upgrade && \
    # get general dependency
    apk add --update bash curl python openssl-dev && \
    # get kcpclient
    curl -sSL "$KCP_URL" | tar -xvzC /bin/ && \
    # get pen source code
    curl -sSL "$PEN_URL" | tar -xvz && \
    # clean general dependency
    apk del --purge curl openssl-dev

# build pen source code
WORKDIR "$PEN_DIR"
RUN apk add $PEN_DEP && \
    ./configure && \
    make && \
    make install && \
    apk del --purge $PEN_DEP

WORKDIR /
# clean build dependency
RUN rm -rf $PEN_DIR && \
    rm -rf /var/cache/apk/*

ADD init ./
ENTRYPOINT ./init && bash
