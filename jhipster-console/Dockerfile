FROM docker.elastic.co/kibana/kibana-oss:6.4.1

ENV ELASTICSEARCH_URL=http://jhipster-elasticsearch:9200

COPY --chown=1000:0 kibana.yml /usr/share/kibana/config/kibana.yml
RUN ./bin/kibana-plugin install https://github.com/sivasamyk/logtrail/releases/download/v0.1.30/logtrail-6.4.1-0.1.30.zip
COPY logtrail.json /usr/share/kibana/plugins/logtrail/logtrail.json
