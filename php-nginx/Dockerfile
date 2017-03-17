FROM hub.c.163.com/public/centos:6.5

RUN yum install -y http://mirror.webtatic.com/yum/el6/latest.rpm http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm &&\
	touch /etc/sysconfig/network &&\
	yum install -y libmcrypt libmcrypt-devel php70w.x86_64 php70w-cli.x86_64 php70w-common.x86_64 php70w-gd.x86_64 php70w-ldap.x86_64 php70w-mbstring.x86_64 php70w-mcrypt.x86_64 php70w-mysql.x86_64 php70w-pdo.x86_64 php70w-devel.x86_64 php70w-opcache.x86_64 php70w-fpm nginx gcc tar php70w-pear.noarch git wget && \
	yum clean all

COPY ./nginx/ /etc/nginx/
COPY ./run.sh /run.sh

VOLUME ["/www"]

EXPOSE 80

CMD ["/run.sh"]
