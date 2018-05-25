FROM ubuntu:18.04
MAINTAINER https://github.com/tinytux

ENV HOME /root

RUN apt-get update && \
    apt-get install -y \
        wget \
        xz-utils lzma \
        make gcc libelf-dev bc

RUN groupadd -r user && useradd --no-log-init -r -g user user && mkdir /home/user && chown user:user /home/user

USER user
RUN cd /home/user && wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.14.43.tar.xz
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD ["su", "-", "user", "-c", "/docker-entrypoint.sh"]

USER root
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

