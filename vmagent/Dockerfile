# Use the official Home Assistant base image (auto-detected per architecture)
ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.7
FROM ${BUILD_FROM}

# Version of vmagent to install
ENV VM_VERSION=v1.103.0

# Pick correct architecture automatically (HA passes BUILD_ARCH)
ARG BUILD_ARCH
RUN echo "Building for ${BUILD_ARCH:-unknown} architecture"

# Translate HA arch name -> vmagent arch string
RUN case "${BUILD_ARCH}" in \
      "aarch64"|"armv8"|"rpi4-64") ARCH="arm64" ;; \
      "armv7"|"armhf") ARCH="arm" ;; \
      "amd64") ARCH="amd64" ;; \
      "i386")  ARCH="386" ;; \
      *) ARCH="arm64" ;; \
    esac \
    && echo "Detected VM architecture: ${ARCH}" \
    && apk add --no-cache curl tar \
    && curl -L -o /tmp/vmutils.tar.gz \
       https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/${VM_VERSION}/vmutils-linux-${ARCH}-${VM_VERSION}.tar.gz \
    && tar -xzf /tmp/vmutils.tar.gz -C /usr/local/bin vmagent \
    && chmod +x /usr/local/bin/vmagent \
    && rm -rf /tmp/vmutils.tar.gz

# Copy startup script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Start vmagent
CMD [ "/run.sh" ]
