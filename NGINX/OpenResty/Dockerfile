FROM daocloud.io/library/centos:7.2.1511

RUN yum install -y readline-devel pcre-devel openssl-devel perl wget gcc make &&\
    wget https://openresty.org/download/openresty-1.11.2.3.tar.gz &&\
    tar xzvf openresty-1.11.2.3.tar.gz &&\
    cd openresty-1.11.2.3 &&\
    ./configure --prefix=/opt/openresty\
             --with-luajit\
             --without-http_redis2_module \
             --with-http_iconv_module &&\
    make && make install &&\
    ln -s /opt/openresty/nginx/conf /etc/nginx &&\
    sed -i "79a \    include '/etc/nginx/conf.d/*.conf';" nginx.conf

EXPOSE 80

COPY docker-entrypoint.sh /usr/local/bin/

CMD ["docker-entrypoint.sh"]
