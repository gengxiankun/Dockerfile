FROM centos:7.2.1511
RUN yum install wget tar gcc pcre-devel openssl-devel make -y &&\
    wget 'http://nginx.org/download/nginx-1.13.6.tar.gz' &&\
    tar -xzvf nginx-1.13.6.tar.gz &&\
    cd nginx-1.13.6/ &&\
    ./configure --prefix=/usr/local/nginx-1.13.6 &&\
    make && make install &&\
    ln -s /usr/local/nginx-1.13.6/sbin/nginx /usr/bin/ &&\
    ln -s /usr/local/nginx-1.13.6/conf/ /etc/nginx

COPY docker-entrypoint.sh /usr/local/bin/

CMD ["docker-entrypoint.sh"]
