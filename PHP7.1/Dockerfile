FROM daocloud.io/library/centos:7.2.1511
RUN yum install -y epel-release &&\
	rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm &&\
	yum install -y --enablerepo=remi --enablerepo=remi-php71 php php-opcache php-devel php-mbstring php-xml php-zip php-cli php-fpm php-mcrypt php-mysql php-pdo php-curl php-gd php-mysqld php-bcmath openssh-server &&\
	yum clean all

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 9000

CMD ["docker-entrypoint.sh"]
