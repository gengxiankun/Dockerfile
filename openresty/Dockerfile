FROM centos:7.2.1511

RUN yum install -y readline-devel pcre-devel openssl-devel perl wget gcc make &&\
    wget https://openresty.org/download/ngx_openresty-1.9.3.1.tar.gz &&\
    tar xzvf ngx_openresty-1.9.3.1.tar.gz &&\
    cd ngx_openresty-1.9.3.1 &&\
    ./configure --prefix=/opt/openresty\
             --with-luajit\
             --without-http_redis2_module \
             --with-http_iconv_module &&\
    make && make install &&\
    sed "$ aexport PATH=\$PATH:/opt/openresty/nginx/sbin" /etc/profile &&\
    ln -s /opt/openresty/nginx/conf /etc/nginx

EXPOSE 80
COPY docker-entrypoint.sh /usr/local/bin/

CMD ["docker-entrypoint.sh"]
