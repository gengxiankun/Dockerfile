FROM centos:7.2.1511

RUN groupadd ldap &&\
    useradd -g ldap ldap &&\
    yum install -y openldap openldap-clients openldap-servers migrationtools pam_ldap python-ldap &&\
    yum clean all

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 389

CMD ["docker-entrypoint.sh"]