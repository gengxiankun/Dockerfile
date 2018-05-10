FROM centos:7.2.1511
RUN yum install -y epel-release &&\
	rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm &&\
	yum install -y --enablerepo=remi --enablerepo=remi-php56 php php-opcache php-devel php-mbstring php-xml php-zip php-cli php-fpm php-mcrypt php-mysql php-pdo php-curl php-gd php-mysqld php-bcmath openssh-server nginx &&\
	yum clean all

RUN rpm -ivh https://kojipkgs.fedoraproject.org/packages/http-parser/2.7.1/3.el7/x86_64/http-parser-2.7.1-3.el7.x86_64.rpm &&\
	yum -y install nodejs openssl &&\
	npm set registry https://registry.npm.taobao.org &&\
	npm set disturl https://npm.taobao.org/dist &&\
	npm cache clean &&\
	yum clean all

RUN npm install -g fis3 &&\
	yum install java-1.8.0-openjdk* -y &&\
	npm install -g fis3-smarty &&\
	npm install -g fis-postprocessor-require-async &&\
	npm install -g fis-parser-jdists

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 9000

ENTRYPOINT ["docker-entrypoint.sh"]