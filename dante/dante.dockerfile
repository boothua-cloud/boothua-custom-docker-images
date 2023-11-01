FROM debian:stable
LABEL org.opencontainers.image.authors="yid-h[boothua@163.com]"

ENV DANTE_VER 1.4.3

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/dante
COPY dante-${DANTE_VER}.tar.gz /tmp/dante/

RUN tar -xzvf /tmp/dante/dante-${DANTE_VER}.tar.gz -C /tmp/dante && \
    cd /tmp/dante/dante-${DANTE_VER} && \
    ./configure && \
    make -j8 && \
    make -j8 install

RUN rm -rf /tmp/dante

COPY sockd.conf /etc/

EXPOSE 1080

CMD ["sockd"]
