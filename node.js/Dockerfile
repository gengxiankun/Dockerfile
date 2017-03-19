FROM hub.c.163.com/public/centos:6.5

#node.js && npm
RUN yum -y install wget &&\
	yum -y install tar &&\
	wget https://npm.taobao.org/mirrors/node/latest-v4.x/node-v4.4.7-linux-x64.tar.gz &&\
	tar -zxvf node-v4.4.7-linux-x64.tar.gz &&\
	export PATH="$PATH":/node-v4.4.7-linux-x64/bin

#hold
CMD ["／run.sh"]

	