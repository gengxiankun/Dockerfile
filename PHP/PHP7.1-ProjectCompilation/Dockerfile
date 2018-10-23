FROM daocloud.io/library/centos:7.2.1511

RUN yum install -y epel-release &&\
	rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm &&\
	yum install -y --enablerepo=remi --enablerepo=remi-php71 php php-opcache php-devel php-mbstring php-xml php-zip php-cli php-mcrypt php-mysql php-pdo php-curl php-gd php-mysqld php-bcmath openssh-server git openssh-server openssh-clients wget zip unzip &&\
	yum clean all

RUN curl -sSL https://getcomposer.org/installer | php &&\
    mv composer.phar /usr/local/bin/composer &&\
    composer global require fxp/composer-asset-plugin v1.4.2 -vvv

CMD ["/usr/sbin/init"]
