# Home Assistant add-on base image for aarch64
ARG BUILD_FROM=ghcr.io/hassio-addons/base-aarch64:15.0.7
FROM ${BUILD_FROM}

# Version of vmagent to install
ENV VM_VERSION=v1.103.0
ENV ARCH=arm64

# Install dependencies and download vmagent binary
RUN apk add --no-cache curl tar \
    && curl -L -o /tmp/vmutils.tar.gz \
       https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/${VM_VERSION}/vmutils-linux-${ARCH}-${VM_VERSION}.tar.gz \
    && tar -xzf /tmp/vmutils.tar.gz -C /usr/local/bin vmagent \
    && chmod +x /usr/local/bin/vmagent \
    && rm -rf /tmp/vmutils.tar.gz

# Copy start script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Default command
CMD [ "/run.sh" ]
