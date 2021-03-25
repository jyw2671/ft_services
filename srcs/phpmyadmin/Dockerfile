FROM		alpine:3.12.0

RUN		apk add --no-cache nginx

COPY		/phpmyadmin.tar.gz /
#COPY		/default.conf /etc/nginx/conf.d/
COPY		/set.sh /usr/sbin/set.sh

RUN		chmod 777 /usr/sbin/set.sh

EXPOSE		5000

ENTRYPOINT	[ "/usr/sbin/set.sh" ]
