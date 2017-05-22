FROM logstash
COPY logstash_indexer.conf /etc/logstash/conf.d/
COPY ./run.sh /run.sh

CMD ["/run.sh"]