FROM jsurf/rpi-raspbian
COPY qemu-arm-static /usr/bin
# Updates at http://downloads.slimdevices.com/nightly/index.php?ver=8.0

ENV    SQUEEZE_VOL_PERSIST=/var/lib/squeezeboxserver \
	SQUEEZE_VOL_LOG=/var/log/squeezeboxserver \
	LANG=C.UTF-8 \
	LMS_URL=http://downloads.slimdevices.com/nightly/8.0/lms/5949ad56255da8462b0e9f9fd6153acba5a7a7b3/logitechmediaserver_8.0.0~1600144351_arm.deb

RUN apt-get update && \
    apt-get -y install perl adduser iputils-ping curl wget faad flac lame sox libio-socket-ssl-perl && \
    curl -Lf -o /tmp/lms.deb $LMS_URL && \
	dpkg -i /tmp/lms.deb && \
	rm -f /tmp/lms.deb && \
	apt-get clean

VOLUME 	$SQUEEZE_VOL_PERSIST $SQUEEZE_VOL_LOG
EXPOSE 	3483 3483/udp 9000 9090

COPY entrypoint.sh.txt /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
