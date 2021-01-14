FROM ubuntu:latest

ENV LIGHTTPD_VERSION=1.4.55-r1

COPY etc/lighttpd/* /etc/lighttpd/
COPY start.sh /usr/local/bin/

EXPOSE 80

VOLUME /var/www/localhost
VOLUME /etc/lighttpd

CMD ["start.sh"]
