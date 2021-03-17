FROM		alpine:3.12.0

RUN		apk update; \
		apk add --no-cache add nginx

COPY		/wordpress.tar.gz /
COPY		/default.conf /etc/nginx/conf.d/
COPY		/set.sh /usr/sbin/set.sh

RUN		chmod 777 /usr/sbin/set.sh

EXPOSE		5050

ENTRYPOINT	["sh", "/usr/sbin/set.sh"]

