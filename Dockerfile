FROM ubuntu:22.04
LABEL maintainer="takeo07 <miya.takeo@gmail.com>"

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    supervisor \
    xvfb \
    xfce4 \
    xfce4-terminal \
    x11vnc \
    novnc \
    vim-tiny && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

EXPOSE 8080
COPY rootfs/etc/supervisor/conf.d/* /etc/supervisor/conf.d/
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]