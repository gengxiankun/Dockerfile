FROM logstash
COPY logstash_agent.conf /etc/logstash/conf.d/
COPY ./run.sh /run.sh

CMD ["/run.sh"]