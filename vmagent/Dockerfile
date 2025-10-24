ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.7
FROM ${BUILD_FROM}

# Versions of vmagent
ENV VM_VERSION=v1.103.0

RUN apk add --no-cache curl tar && \
    curl -L -o /tmp/vm.tar.gz https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/${VM_VERSION}/vmutils-linux-arm64-${VM_VERSION}.tar.gz && \
    tar -xzf /tmp/vm.tar.gz -C /usr/local/bin vmagent && \
    chmod +x /usr/local/bin/vmagent && \
    rm -rf /tmp/vm.tar.gz

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
