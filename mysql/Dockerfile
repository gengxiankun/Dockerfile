#mysql
#使用基于网易的国内cnetos6.5镜像
FROM hub.c.163.com/public/centos:6.5
MAINTAINER xiankun.geng

#安装mysql服务
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm &&\
	rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm &&\
	yum install -y mysql55w mysql55w-server &&\
	touch /etc/sysconfig/network &&\
	/etc/init.d/mysqld start &&\
	mysql -e "grant all privileges on *.* to 'root'@'%' identified by 'root';" &&\
	mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by 'root';" &&\
	sed -i "/mysqld]/a \skip-name-resolve\nlower_case_table_names=1" /etc/my.cnf

#启用3306
EXPOSE 3306

COPY ./run.sh /run.sh

#启动
CMD ["/run.sh"]
