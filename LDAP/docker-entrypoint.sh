#!/bin/bash
# auther: ge2x3k2@gmail.com
# Usage:
#  docker run -d \
#  -p 389:389 \
#  -e LDAP_DOMAIN= \
#  -e LDAP_COM= \
#  -e LDAP_MANAGER= \
#  -e LDAP_PASSWD= \
#  --name ldap \
#  ldap

set -x

#配置ldap
sed -i "s/dc=my-domain/dc=${LDAP_DOMAIN}/g" /etc/openldap/slapd.d/cn\=config/olcDatabase\=\{2\}hdb.ldif
sed -i "s/dc=com/dc=${LDAP_COM}/g" /etc/openldap/slapd.d/cn\=config/olcDatabase\=\{2\}hdb.ldif
sed -i "s/cn=Manager/cn=${LDAP_MANAGER}/g" /etc/openldap/slapd.d/cn\=config/olcDatabase\=\{2\}hdb.ldif
ldap_passwd=$(slappasswd -s ${LDAP_PASSWD})
sed -i "$ aolcRootPW: ${ldap_passwd}" /etc/openldap/slapd.d/cn\=config/olcDatabase\=\{2\}hdb.ldif

sed -i "s/cn=Manager,dc=my-domain,dc=com/cn=${LDAP_MANAGER},dc=${LDAP_DOMAIN},dc=${LDAP_COM}/g" /etc/openldap/slapd.d/cn\=config/olcDatabase\=\{1\}monitor.ldif

#设置ldap用户、用户组权限
chown -R ldap.ldap /var/lib/ldap
slaptest -u

#启动ldap
/usr/sbin/slapd -h "ldapi:/// ldap://" -u ldap

#设置ldap默认数据库
cd /etc/openldap/schema/
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/cosine.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/nis.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/collective.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/corba.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/core.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/duaconf.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/dyngroup.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/inetorgperson.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/java.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/misc.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/openldap.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/pmi.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -D "cn=config" -f /etc/openldap/schema/ppolicy.ldif

cd /usr/share/migrationtools/
sed -i "71 s/padl.com/${LDAP_DOMAIN}.${LDAP_COM}/g" migrate_common.ph
sed -i "74 s/dc=padl\,dc=com/dc=${LDAP_DOMAIN}\,dc=${LDAP_COM}/g" migrate_common.ph
sed -i "90 s/0/1/g" migrate_common.ph
./migrate_base.pl >/root/base.ldif
ldapadd -x -w ${LDAP_PASSWD} -D "cn=${LDAP_MANAGER},dc=${LDAP_DOMAIN},dc=${LDAP_COM}" -f /root/base.ldif

sleep 5
ldapmodify -Q -Y EXTERNAL -H ldapi:/// <<EOF
dn: cn=config 
changetype: modify
add: olcDisallows
olcDisallows: bind_anon
EOF
 
ldapmodify -Q -Y EXTERNAL -H ldapi:/// <<EOF
dn: olcDatabase={-1}frontend,cn=config 
changetype: modify
add: olcRequires
olcRequires: authc
EOF
kill -INT `cat /run/openldap/slapd.pid`
sleep 5
/usr/sbin/slapd -h "ldapi:/// ldap://" -u ldap -d 8
