FROM daocloud.io/library/centos:7.2.1511

ADD go1.9.2.linux-amd64.tar.gz /usr/local

RUN yum install vim git gcc openssl -y

RUN  mkdir -pv /opt/gopath/src/github.com &&\
	mkdir -pv /opt/gopath/src/golang.org &&\
	PATH=$PATH:/usr/local/go/bin &&\
	GOPATH=/opt/gopath &&\
	GOROOT=/usr/local/go &&\
	export PATH &&\
	export GOPATH &&\
	export GOROOT &&\
	cd /opt/gopath/src/github.com &&\
	git clone https://github.com/ethereum/go-ethereum.git &&\
	cd go-ethereum &&\
	make all &&\
	cp /opt/gopath/src/github.com/go-ethereum/build/bin/* /usr/local/bin/

CMD ["/usr/sbin/init"]
