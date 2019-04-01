FROM centos:7.2.1511

RUN yum install -y epel-release &&\
    rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm

RUN yum install -y --enablerepo=remi --enablerepo=remi-php71 \
	php \
	php-opcache \
	php-devel \
	php-mbstring \
	php-xml \
	php-zip \
	php-cli \
	php-fpm \
	php-mcrypt \
	php-mysql \
	php-pdo \
	php-curl \
	php-gd \
	php-mysqld \
	php-bcmath \
	php-redis\
	php-process \
	php-pear \
	libevent-devel \
	git \
	gcc \
	make \
	yum clean all \
	pecl install event \
	echo extension=event.so > /etc/php.d/30-event.ini
