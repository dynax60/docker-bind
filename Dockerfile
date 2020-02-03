FROM alpine:latest

RUN apk --update add bind bind-tools bind-plugins && rm -rf /var/cache/apk/

COPY ./entrypoint.sh /

EXPOSE 53 53/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
