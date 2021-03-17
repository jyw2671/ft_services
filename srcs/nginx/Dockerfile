FROM		alpine:3.12.0

RUN		apk update; \
		apk add --no-cache nginx openssl
COPY		./set.sh /usr/sbin/set.sh
RUN		chmod 777 /usr/sbin/set.sh
COPY		./default.conf /etc/nginx/conf.d/

RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509\
		-subj "/C=KR/ST=SEOUL/L=Gaepo-dong/O=42Seoul/OU=yjung/CN=localhost"\
		-keyout localhost-nginx.key -out localhost-nginx.crt; \
		mv localhost-nginx.crt /etc/nginx/ssl;	\
		mv localhost-nginx.key /etc/nginx/ssl; \
		chmod 600 etc/nginx/ssl/localhost-nginx.crt etc/nginx/ssl/localhost-nginx.key

EXPOSE		80 443

ENTRYPOINT	["/usr/sbin/set.sh"]
