# docker-openvpn

Simple OpenVPN image with updated version

## Using the image

There is no default config provided by the image, so you'll need to provide your own.

```
docker run -d -n openvpn -v /path/to/openvpn.conf:/etc/openvpn/openvpn.conf ghcr.io/blinklabs-io/openvpn --config /etc/openvpn/openvpn.conf
```
