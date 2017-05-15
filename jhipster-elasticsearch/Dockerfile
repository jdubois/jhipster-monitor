FROM elasticsearch:5.4.0-alpine

VOLUME ["/usr/share/elasticsearch/config"]
VOLUME ["/usr/share/elasticsearch/data"]

# Set environment variables
ENV ES_JAVA_OPTS "-Xms1g -Xmx1g"
ENV CLUSTER_NAME elasticsearch-default

EXPOSE 9200 9300