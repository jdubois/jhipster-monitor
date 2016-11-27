#!/bin/bash

cp /tmp/jhipster-console.svg /usr/share/kibana/optimize/bundles/src/ui/public/images/kibana.svg

# Wait for the Elasticsearch container to be ready before starting Kibana.
 echo "Waiting for Elasticsearch to startup"
 while true; do
     curl ${ELASTICSEARCH_URL} 2>/dev/null && break
     sleep 1
 done

 echo "Loading dashboards"
 cd /tmp
 ./load.sh

[ ! -f /tmp/.initialized ] && echo "Configuring default settings" && curl -XPUT http://${ELASTICSEARCH_URL}/.kibana/config/5.0.0 -d '{"dashboard:defaultDarkTheme": true, "defaultIndex": "logstash-*"}' && touch /tmp/.initialized

echo "Starting Kibana connecting to ${ELASTICSEARCH_URL}"
exec kibana -e http://${ELASTICSEARCH_URL}
