# arm-docker-lms
Logitech slimdevice lms Docker image for RPi

Current version LMS: 8.0.0 nightly

Based on https://github.com/baztian/armhf-lms

Folders to map (for permanent data):
/var/log/squeezeboxserver
/var/lib/squeezeboxserver
map media folder to:
/media

Ports to map:
3483/tcp
3483/udp
9000/tcp
90907tcp

example run:
```
docker run -d \
  -p 9080:9080 \
  -p 9000:9000 \
  -p 3483:3483 \
  -p 3483:3483/udp \
  virtorgan/arm-docker-lms:8.0.0
```
