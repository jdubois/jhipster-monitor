FROM python:2.7-alpine

RUN apk update && apk upgrade && apk add bash curl tar musl-dev linux-headers g++ libffi-dev libffi openssl-dev

ENV SET_CONTAINER_TIMEZONE false
ENV ELASTALERT_VERSION v0.1.14
ENV CONTAINER_TIMEZONE Europe/Paris
ENV ELASTALERT_URL https://github.com/Yelp/elastalert/archive/${ELASTALERT_VERSION}.tar.gz

ENV ELASTALERT_HOME /opt/elastalert
ENV RULES_DIRECTORY /opt/elastalert/rules

ENV ELASTICSEARCH_HOST http://jhipster-elasticsearch
ENV ELASTICSEARCH_PORT 9200
ENV ELASTICSEARCH_USERNAME ""
ENV ELASTICSEARCH_PASSWORD ""

RUN mkdir -p /opt/elastalert

RUN curl -Lo elastalert.tar.gz ${ELASTALERT_URL} && \
    tar -xzvf elastalert.tar.gz -C ${ELASTALERT_HOME} --strip-components 1 && \
    rm elastalert.tar.gz

WORKDIR /opt/elastalert

RUN  pip install "setuptools>=11.3" \
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
