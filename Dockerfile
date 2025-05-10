FROM ubuntu:24.04 AS base

COPY bin/ /usr/local/bin

RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get install -y openvpn iptables \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /usr/local/bin/*

EXPOSE 1194/udp

ENTRYPOINT ["/usr/local/bin/entrypoint"]
