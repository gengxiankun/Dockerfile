#!/bin/bash

/etc/init.d/php-fpm start
/etc/init.d/nginx start
/usr/local/mongodb/bin/mongod --port 27017 --fork --dbpath=/data/mongodb/mongodb_data/ --logpath=/data/mongodb/mongodb_log/mongodb.log --logappend

exec /usr/sbin/sshd -D
