#!/bin/sh

/usr/bin/install -d -o root -g named -m 0750 /etc/bind 
find /etc/bind/* -type d -exec chown root:root {} \;
find /etc/bind -type f  -exec chown root:root {} \;
find /etc/bind -type f  -exec chmod 644 {} \;
find /etc/bind -type f -name rndc.key -exec chown named:named {} \;
find /etc/bind -type f -name rndc.key -exec chmod 644 {} \;

/usr/bin/install -d -o named -g named -m 0755 /var/cache/bind 
chown -R named:named /var/cache/bind
find /etc/bind -type d -exec chmod 755 {} \;
find /etc/bind -type f -exec chmod 644 {} \;

/usr/bin/install -d -o named -g named -m 0755 /var/log/named
chown -R named:named /var/log/named
find /etc/bind -type f -exec chmod 644 {} \;

/usr/bin/install -d -o named -g named -m 0770 /var/run/named

exec $*
