*Usage*

```bash
docker run -d \
 -p 389:389 \
 -e LDAP_DOMAIN= \
 -e LDAP_COM= \
 -e LDAP_MANAGER= \
 -e LDAP_PASSWD= \
 --name ldap \
 ldap/
```
