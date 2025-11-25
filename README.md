# docker-openvpn

Simple OpenVPN image with updated version, optimized for privacy-focused VPN services.

## Using the image

There is no default config provided by the image, so you'll need to provide your own.

```
docker run -d -n openvpn -v /path/to/openvpn.conf:/etc/openvpn/openvpn.conf ghcr.io/blinklabs-io/openvpn --config /etc/openvpn/openvpn.conf
```

The image provides for the ability to provide a custom startup script. It looks for a user script at `/usr/local/bin/entrypoint-user.sh` by default,
but the location can be overridden with the `USER_STARTUP_SCRIPT` environment variable

## Privacy and Security Recommendations

For a no-log, privacy-focused setup:

### OpenVPN Configuration
Use these options in your `openvpn.conf` for strong encryption and no logging:
```conf
# Disable logging
log /dev/null
verb 0

# Strong ciphers
cipher AES-256-GCM
auth SHA256
tls-cipher TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384
tls-version-min 1.2

# Privilege drop
user nobody
group nogroup

# Other privacy settings
persist-key
persist-tun
```

### Docker Run Options
- Use Docker secrets for certificates/keys: `--secret mykey=/path/to/key`
- Run with necessary capabilities only: `--cap-add=NET_ADMIN` (avoid `--privileged`)
- For Kubernetes (Helm), use `securityContext` to limit privileges.

### Maintenance
- Rebuild images regularly to pull security updates from Debian repos.
- Scan for vulnerabilities with tools like Trivy (automated via GitHub Actions).
- Test for leaks using services like ipleak.net while connected.

**Warning**: Running in privileged mode increases security risks—use only when necessary.
