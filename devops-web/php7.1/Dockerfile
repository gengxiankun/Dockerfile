FROM centos:7.2.1511
RUN yum install -y epel-release &&\
	rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm &&\
	yum install -y --enablerepo=remi --enablerepo=remi-php71 php php-opcache php-devel php-mbstring php-cli php-fpm php-mcrypt php-mysql php-pdo php-curl php-gd php-mysqld openssh-server &&\
	yum clean all

COPY ./run.sh /run.sh

EXPOSE 9000

CMD ["/run.sh"]
