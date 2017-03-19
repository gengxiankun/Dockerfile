FROM hub.c.163.com/public/centos:6.5

RUN yum install -y http://mirror.webtatic.com/yum/el6/latest.rpm http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm &&\
	touch /etc/sysconfig/network &&\
	yum install -y libmcrypt libmcrypt-devel php70w.x86_64 php70w-cli.x86_64 php70w-common.x86_64 php70w-gd.x86_64 php70w-ldap.x86_64 php70w-mbstring.x86_64 php70w-mcrypt.x86_64 php70w-mysql.x86_64 php70w-pdo.x86_64 php70w-devel.x86_64 php70w-opcache.x86_64 php70w-fpm nginx gcc tar php70w-pear.noarch git wget && \
	yum clean all &&\
	git clone https://github.com/wg/wrk.git &&\
	wget http://xdebug.org/files/xdebug-2.4.0rc1.tgz &&\
	tar xvzf xdebug-2.4.0rc1.tgz &&\
	cd xdebug-2.4.0RC1 &&\
	phpize &&\
	./configure --enable-xdebug &&\
	make &&\
	make install &&\
	echo -e "zend_extension='/usr/lib64/php/modules/xdebug.so'\nxdebug.remote_enable = 1\nxdebug.remote_connect_back = 1\nxdebug.remote_port = 9000\nxdebug.max_nesting_level = 500" > /etc/php.d/xdebug.ini &&\
	cd ../ &&\
	rm -rf xdebug-2.4.0RC1 &&\
	rm -rf xdebug-2.4.0rc1.tgz &&\
	cd wrk/ &&\
	make &&\
	mv wrk /usr/local/bin/ &&\
	cd ../ &&\
	rm -rf wrk/ &&\
	git clone https://github.com/tideways/php-profiler-extension.git &&\
	cd php-profiler-extension &&\
	phpize &&\
	./configure &&\
	make &&\
	make install &&\
	cd ../ &&\
	rm -rf php-profiler-extension/ &&\
	wget https://github.com/tideways/profiler/archive/v2.0.14.tar.gz &&\
	tar zxvf v2.0.14.tar.gz &&\
	cp /profiler-2.0.14/Tideways.php /usr/lib64/php/modules &&\
	echo -e "extension=tideways.so\ntideways.auto_prepend_library=0" > /etc/php.d/tideways.ini &&\
	echo -e "zend_extension=opcache.so\nopcache.enable=1\nopcache.memory_consumption=128\nopcache.interned_strings_buffer=8\nopcache.max_accelerated_files=4000\nopcache.blacklist_filename=/etc/php.d/opcache*.blacklist\nopcache.huge_code_pages=1\n" > /etc/php.d/opcache.ini &&\
	git clone https://github.com/derickr/vld.git vld &&\
	cd vld &&\
	phpize &&\
	./configure --with-php-config=/usr/bin/php-config --enable-vld &&\
	make install &&\
	echo extension=vld.so > /etc/php.d/vld.ini &&\
	cd ../ &&\
	rm -rf vld/

COPY ./nginx/ /etc/nginx/
COPY ./run.sh /run.sh

VOLUME ["/www"]

EXPOSE 80

CMD ["/run.sh"]
