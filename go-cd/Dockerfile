FROM hellgate75/ubuntu-base:17.10

MAINTAINER Fabrizio Torelli <hellgate75@gmail.com>

ARG GOCD_VERSION=17.7.0-5147

ENV PLUGIN_FILE_URL=""

USER root

RUN mkdir -p /root/downloads

WORKDIR /root/downloads

COPY docker-start-gocd.sh /docker-start-gocd.sh
COPY scripts/start-gocd.sh /usr/local/bin/start-gocd
COPY scripts/stop-gocd.sh /usr/local/bin/stop-gocd
COPY scripts/status-gocd.sh /usr/local/bin/status-gocd
COPY scripts/install-plugins.sh /usr/local/bin/install-plugins-gocd
COPY scripts/download-plugins-file.sh /usr/local/bin/download-plugins-index-gocd

RUN apt-get update \
    && apt-get -y install git curl wget unzip python-setuptools vim git maven gradle \
    && apt-get clean \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://download.gocd.org/binaries/$GOCD_VERSION/generic/go-server-$GOCD_VERSION.zip -O go-server.zip \
    && unzip -d /usr/lib go-server.zip \
    && mv /usr/lib/go-server-* /usr/lib/go-server \
    && mkdir /var/log/go-server \
    && chmod 777 //docker-start-gocd.sh \
    && chmod 777 /usr/local/bin/*-gocd \
    && easy_install gocd-cli

CMD /docker-start-gocd.sh -daemon

ENTRYPOINT ["/docker-start-gocd.sh"]

EXPOSE 8153

VOLUME ["/usr/lib/go-server/plugins/external","/usr/lib/go-server/logs","/usr/lib/go-server/artifacts"]
