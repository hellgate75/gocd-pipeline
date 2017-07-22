FROM hellgate75/ubuntu-base:17.10

MAINTAINER Fabrizio Torelli <hellgate75@gmail.com>

ARG GOCD_VERSION=17.7.0-5147

ENV GO_SERVER_URL="https://localhost:8154/go" \
    DAEMON=Y \
    GO_AGENT_STARTUP_DELAY=0 \
    GOPATH="/root/go" \
    AGENT_WORK_DIR="/usr/lib/go-agent"

USER root

RUN mkdir -p /root/downloads

WORKDIR /root/downloads

COPY docker-start-gocd.sh /docker-start-gocd.sh
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY scripts/start-gocd.sh /usr/local/bin/start-gocd-agent
COPY scripts/stop-gocd.sh /usr/local/bin/stop-gocd-agent
COPY scripts/status-gocd.sh /usr/local/bin/status-gocd-agent

RUN apt-get update \
    && apt-get -y install git curl wget unzip python-setuptools vim git maven gradle golang \
    && apt-get clean \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://download.gocd.org/binaries/$GOCD_VERSION/generic/go-agent-$GOCD_VERSION.zip -O go-cd-agent.zip \
    && unzip -d /usr/lib go-cd-agent.zip \
    && mv /usr/lib/go-agent-* /usr/lib/go-agent \
    && rm -f go-cd-agent.zip \
    && mkdir /var/log/go-agent \
    && mkdir -p /root/go \
    && chmod 777 //docker-start-gocd.sh \
    && chmod 777 //docker-entrypoint.sh \
    && chmod 777 /usr/local/bin/*-gocd-agent

WORKDIR /usr/lib/go-agent

CMD /docker-start-gocd.sh -daemon

ENTRYPOINT ["/docker-entrypoint.sh"]

#EXPOSE 8154
