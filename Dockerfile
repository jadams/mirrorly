FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y bash gawk curl parallel gzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN useradd -m -s /bin/bash -U mirror \
 && mkdir -p /mirror \
 && chown mirror:mirror /mirror
COPY mirrorly /usr/local/bin/mirrorly
COPY mirrorly.conf /etc/mirrorly.conf
COPY mirror.list /etc/apt/mirror.list
USER mirror
VOLUME [ "/mirror" ]
ENTRYPOINT [ "mirrorly" ]
