FROM logstash
COPY logstash_agent.conf /etc/logstash/conf.d/
COPY docker-entrypoint.sh /usr/local/bin/

CMD ["docker-entrypoint.sh"]