FROM centos:7.2.1511

RUN yum install -y epel-release &&\
	rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm &&\
	yum install -y --enablerepo=remi --enablerepo=remi-php71 php php-opcache php-devel php-mbstring php-xml php-zip php-cli php-fpm php-mcrypt php-mysql php-pdo php-curl php-gd php-mysqld openssh-server php-mongodb &&\
	yum install -y git wget gcc tar make &&\
	yum clean all &&\
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
	mkdir www &&\
	cd www/ &&\
	git clone https://github.com/maxincai/xhgui.git &&\
	chmod -R 0777 xhgui/cache/ &&\
	cd xhgui/ &&\
	curl -sS https://getcomposer.org/installer | php &&\
	php install.php

VOLUME ["/www"]

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 9000

CMD ["docker-entrypoint.sh"]