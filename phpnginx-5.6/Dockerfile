FROM centos:7.2.1511
RUN yum install -y epel-release &&\
	rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm &&\
	yum install -y --enablerepo=remi --enablerepo=remi-php56 php php-opcache php-devel php56-php-mbstring php-cli php-fpm php-mcrypt php-mysql php-pdo php-curl php-gd php-mysqld nginx openssh-server &&\
	yum clean all &&\
	ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key &&\
	cp /opt/remi/php56/root/usr/lib64/php/modules/mbstring.so /usr/lib64/php/modules/ &&\
	echo -e "extension=mbstring.so" > /etc/php.d/20-mbstring.ini

COPY ./run.sh /run.sh

EXPOSE 80

VOLUME ["/www"]

CMD ["/run.sh"]
