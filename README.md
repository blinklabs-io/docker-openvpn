# docker-openvpn

Simple OpenVPN image with updated version

## Using the image

There is no default config provided by the image, so you'll need to provide your own.

```
docker run -d -n openvpn -v /path/to/openvpn.conf:/etc/openvpn/openvpn.conf ghcr.io/blinklabs-io/openvpn --config /etc/openvpn/openvpn.conf
```

The image provides for the ability to provide a custom startup script. It looks for a user script at `/usr/local/bin/entrypoint-user.sh` by default,
but the location can be overridden with the `USER_STARTUP_SCRIPT` environment variable
