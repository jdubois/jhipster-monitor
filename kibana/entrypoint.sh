#!/usr/bin/env bash

cp /tmp/jhipster-console.svg /opt/kibana/optimize/bundles/src/ui/public/images/kibana.svg

# Wait for the Elasticsearch container to be ready before starting Kibana.
echo "Waiting for Elasticsearch to startup"
while true; do
    curl elk-elasticsearch:9200 2>/dev/null && break
    sleep 1
done

echo "Loading dashboards"
cd /tmp
./load.sh

echo "Configuring default advanced settings"
curl "http://elk-elasticsearch:9200/.kibana/config/4.4.1?pretty" 2>/dev/null |grep '"_source :{ }"' && curl -XPUT http://elk-elasticsearch:9200/.kibana/config/4.4.1 -d '{"dashboard:defaultDarkTheme": true, defaultIndex": "logstash-*"}'

echo "Starting Kibana"
exec kibana
