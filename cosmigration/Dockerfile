FROM daocloud.io/library/centos:7.2.1511

RUN yum install -y java-1.8.0-openjdk git &&\
    git clone https://github.com/tencentyun/cos_migrate_tool_v5.git --depth=1

WORKDIR /cos_migrate_tool_v5

CMD ["/usr/sbin/init"]