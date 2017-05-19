#!/bin/bash

#ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key

sed -i 's/listen = 127.0.0.1:9000/listen = [::]:9000/p' /etc/php-fpm.d/www.conf
sed -i '/listen.allowed_clients = 127.0.0.1/d' /etc/php-fpm.d/www.conf
sed -i "s/daemonize = yes/daemonize = no/p" /etc/php-fpm.conf
/usr/sbin/php-fpm -c /etc/php.ini -y /etc/php-fpm.conf
