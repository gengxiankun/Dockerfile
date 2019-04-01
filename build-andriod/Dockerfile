FROM daocloud.io/library/centos:7.2.1511

RUN yum install java-1.8.0-openjdk* zip unzip which -y &&\
	yum clean all &&\
	echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-2.el7_6.x86_64" >> /etc/profile &&\
	echo "export JRE_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-2.el7_6.x86_64" >> /etc/profile &&\
	echo "export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib" >> /etc/profile &&\
	echo "export PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile &&\
	curl -s "https://get.sdkman.io" | bash &&\
	echo 'source "/root/.sdkman/bin/sdkman-init.sh"' >> /etc/profile &&\
	source /etc/profile &&\
	sdk install gradle

CMD ["/usr/sbin/init"]