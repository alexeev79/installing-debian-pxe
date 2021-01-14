FROM alpine:3.12

RUN apk --no-cache add dnsmasq

COPY dnsmasq.conf /etc/

RUN mkdir /media/pxeboot

COPY /pxeboot/* /media/pxeboot/

RUN chmod -R 777 /media/pxeboot/
RUN chown -R nobody:nogroup /media/pxeboot/

EXPOSE 53 53/udp
EXPOSE 67 67/udp
EXPOSE 69 69/udp

CMD ["dnsmasq", "-d"]
