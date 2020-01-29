FROM alpine:latest

RUN apk --update add bind bind-tools bind-plugins && rm -rf /var/cache/apk/

EXPOSE 53 53/udp

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]