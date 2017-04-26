#!/bin/bash


/usr/sbin/php-fpm -c /etc/php.ini -y /etc/php-fpm.conf

/usr/sbin/nginx -c /etc/nginx/nginx.conf

exec /usr/sbin/init

