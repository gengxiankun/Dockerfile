FROM daocloud.io/library/centos:7.2.1511

RUN yum install -y epel-release &&\
	rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm &&\
	yum install -y --enablerepo=remi --enablerepo=remi-php71 php php-opcache php-devel php-mbstring php-xml php-zip php-cli php-mcrypt php-mysql php-pdo php-curl php-gd php-mysqld php-bcmath openssh-server wget gcc gcc-c++ make &&\
	yum clean all

RUN wget https://github.com/swoole/swoole-src/archive/v4.2.1.tar.gz &&\
	tar -zxvf v4.2.1.tar.gz &&\
	cd swoole-src-4.2.1 &&\
	phpize &&\
	./configure &&\
	make && make install &&\
	sed -i '$a \\n[swoole]\nextension=swoole.so' /etc/php.ini &&\
	cd ../ && rm -rf v4.2.1.tar.gz swoole-src-4.2.1

COPY docker-entrypoint.sh /usr/local/bin/

COPY servers /servers

CMD ["docker-entrypoint.sh"]