FROM docker.elastic.co/logstash/logstash:5.6.3

COPY logstash.yml /usr/share/logstash/config/
COPY logstash.conf /usr/share/logstash/pipeline/

ENV ELASTICSEARCH_HOST=jhipster-elasticsearch \
    ELASTICSEARCH_PORT=9200 \
    INPUT_TCP_PORT=5000 \
    INPUT_UDP_PORT=5000 \
    LOGSTASH_DEBUG=false

CMD logstash -f /usr/share/logstash/pipeline/logstash.conf
