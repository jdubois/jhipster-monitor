#!/usr/bin/env bash
# Create index patterns in Elasticsearch
echo "Creating index patterns if not present"
curl -XPUT $ELASTICSEARCH_URL/.kibana/index-pattern/logstash-* -d '{"title" : "logstash-*",  "timeFieldName": "@timestamp"}'
curl -XPUT $ELASTICSEARCH_URL/.kibana/config/$(heartbeat --version | cut -d' ' -f3) -d '{"defaultIndex" : "logstash-*"}'
