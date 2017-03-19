#!/bin/bash

/etc/init.d/mysqld start
exec /usr/sbin/sshd -D
