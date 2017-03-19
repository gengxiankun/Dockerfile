FROM hub.c.163.com/public/centos:6.5

COPY ./go1.8.linux-amd64.tar.gz /
COPY ./run.sh /run.sh

RUN yum -y install tar wget &&\
	yum clean all &&\
	wget https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz &&\
	tar -C /usr/local -xzf go1.8.linux-amd64.tar.gz &&\
	sed -i '$a export PATH=$PATH:/usr/local/go/bin' ~/.bash_profile &&\
	ln -s /usr/local/go/bin/go /usr/local/bin
	
CMD ["/run.sh"]
