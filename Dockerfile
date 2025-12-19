FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y bash gawk curl parallel gzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD mirrorly /usr/local/bin/mirrorly
ADD mirrorly.conf /etc/mirrorly.conf
ADD mirror.list /etc/apt/mirror.list
RUN useradd -d /mirror -m -s /bin/bash -U mirror
USER mirror
VOLUME [ "/mirror" ]
ENTRYPOINT [ "mirrorly" ]
