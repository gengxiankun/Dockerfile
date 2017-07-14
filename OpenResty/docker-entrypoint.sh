#!/bin/bash
# auther: ge2x3k2@gmail.com

ln -s /opt/openresty/nginx/sbin/nginx /usr/local/bin/
nginx -c /etc/nginx/nginx.conf -g 'daemon off;'
