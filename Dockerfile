FROM debian:bookworm-slim AS base

COPY bin/ /usr/local/bin

RUN apt-get update \
 && apt-get dist-upgrade -y \
# Install OpenVPN (latest 2.6.x from Debian repos; rebuild image periodically for security updates)
 && apt-get install -y --no-install-recommends openvpn iptables \
 && apt-get purge -y --auto-remove cron rsyslog \
 && rm -rf /var/log/* \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /usr/local/bin/*

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD pgrep -f openvpn || exit 1

EXPOSE 1194/udp

ENTRYPOINT ["/usr/local/bin/entrypoint"]
