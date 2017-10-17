FROM python:2.7-alpine

RUN apk update && apk upgrade && apk add bash curl tar musl-dev linux-headers g++ libffi-dev libffi openssl-dev

ENV SET_CONTAINER_TIMEZONE=false \
    CONTAINER_TIMEZONE=UTC \
    ELASTALERT_URL=https://github.com/Yelp/elastalert/archive/v0.1.21.tar.gz \
    ELASTALERT_HOME=/opt/elastalert \
    RULES_DIRECTORY=/opt/elastalert/rules \
    ELASTICSEARCH_HOST=http://jhipster-elasticsearch \
    ELASTICSEARCH_PORT=9200 \
    ELASTICSEARCH_USERNAME="" \
    ELASTICSEARCH_PASSWORD=""

RUN mkdir -p /opt/elastalert

RUN curl -Lo elastalert.tar.gz ${ELASTALERT_URL} && \
    tar -xzvf elastalert.tar.gz -C ${ELASTALERT_HOME} --strip-components 1 && \
    rm elastalert.tar.gz

WORKDIR /opt/elastalert

RUN pip install "requests==2.18.1" && \ 
    pip install "setuptools>=11.3" && \
    python setup.py install

COPY ./start-elastalert.sh /opt/start-elastalert.sh
RUN chmod +x /opt/start-elastalert.sh
#RUN sed -i -e 's/\r$//' /opt/start-elastalert.sh

COPY ./config.yaml /opt/elastalert/
RUN mkdir /opt/elastalert/rules

VOLUME ["/opt/elastalert/"]
VOLUME ["/opt/elastalert/rules"]

# Launch Elastalert when a container is started.
CMD ["/opt/start-elastalert.sh"]
