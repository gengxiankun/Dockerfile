#!/bin/bash

/etc/init.d/php-fpm start
/etc/init.d/nginx start

exec /usr/sbin/sshd -D
