FROM hub.c.163.com/public/centos:6.5
RUN cd /usr/ &&\
	yum install -y wget tar gcc pcre-devel openssl openssl-devel &&\
	wget http://tengine.taobao.org/download/tengine-2.2.0.tar.gz &&\
	tar zxvf tengine-2.2.0.tar.gz &&\
	cd tengine-2.2.0 &&\
	./configure --with-http_upstream_check_module &&\
	make &&\
	make install &&\
	ln -s /usr/local/nginx/conf/ /etc/nginx

COPY ./run.sh /run.sh

CMD ["/run.sh"]