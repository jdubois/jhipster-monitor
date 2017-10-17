FROM docker.elastic.co/kibana/kibana:5.6.3

ENV ELASTICSEARCH_URL=http://jhipster-elasticsearch:9200
COPY kibana.yml /usr/share/kibana/config/kibana.yml
RUN ./bin/kibana-plugin install https://github.com/sivasamyk/logtrail/releases/download/v0.1.22/logtrail-5.6.3-0.1.22.zip
COPY logtrail.json /usr/share/kibana/plugins/logtrail/logtrail.json