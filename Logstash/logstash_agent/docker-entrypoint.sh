#!/bin/bash -x
# auther: ge2x3k2@gmail.com
PS4='+[$LINENO]'

if [[ ! -z "${NGINX_PATH}" ]]; then
	sed -i "s/\$NGINX_PATH/$NGINX_PATH/g" /etc/logstash/conf.d/logstash_agent.conf 
fi

if [[ ! -z "${REDIS_HOST}" ]]; then 
	sed -i "s/\$REDIS_HOST/$REDIS_HOST/g" /etc/logstash/conf.d/logstash_agent.conf 
fi

/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/logstash_agent.conf
