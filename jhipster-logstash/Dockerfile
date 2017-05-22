FROM docker.elastic.co/logstash/logstash:5.4.0

COPY logstash.yml /usr/share/logstash/config/
COPY logstash.conf /usr/share/logstash/pipeline/

ENV ELASTICSEARCH_HOST=jhipster-elasticsearch
ENV INPUT_UDP_PORT=5000