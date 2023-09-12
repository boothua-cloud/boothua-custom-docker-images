FROM debian:stable

ENV DANTE_VER 1.4.3

RUN apt-get update && \
    apt-get install -y build-essential curl

RUN mkdir /tmp/dante \
    && cd /tmp/dante \
    && curl -LO https://www.inet.no/dante/files/dante-${DANTE_VER}.tar.gz \
    && tar -xzf dante-${DANTE_VER}.tar.gz \
    && cd dante-${DANTE_VER} \
    && ./configure \
    && make -j8 \
    && make -j8 install \
    && rm -rf /tmp/dante

COPY ./sockd.conf /etc/

EXPOSE 1080

CMD ["sockd"]