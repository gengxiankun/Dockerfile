#!/bin/bash -x
# auther: ge2x3k2@gmail.com
PS4='+[$LINENO]'

if [[ ! -z "${REDIS_HOST}" ]]; then 
	sed -i "s/\$REDIS_HOST/$REDIS_HOST/g" /etc/logstash/conf.d/logstash_indexer.conf 
fi

if [[ ! -z "${ELASTICSEARCH_HOST}" ]]; then 
	sed -i "s/\$ELASTICSEARCH_HOST/$ELASTICSEARCH_HOST/g" /etc/logstash/conf.d/logstash_indexer.conf 
fi

/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/logstash_indexer.conf