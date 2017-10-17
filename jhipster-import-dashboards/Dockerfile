FROM docker.elastic.co/beats/heartbeat:5.6.3

COPY dashboards /tmp/dashboards
COPY wait-for-elasticsearch.sh create-index-patterns.sh ./
ENV ELASTICSEARCH_URL=http://jhipster-elasticsearch:9200

CMD ./wait-for-elasticsearch.sh && ./create-index-patterns.sh && ./scripts/import_dashboards -es  $ELASTICSEARCH_URL -dir /tmp/dashboards