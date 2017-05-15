FROM logstash:5.4.0-alpine

ADD conf/logstash.conf /conf/
VOLUME ["/conf"]

ENV INPUT_UDP_PORT 5000
ENV ELASTICSEARCH_HOST jhipster-elasticsearch