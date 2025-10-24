#!/usr/bin/with-contenv bashio

CONFIG_FILE=$(bashio::config 'scrape_config')
REMOTE_URL=$(bashio::config 'remote_write_url')

bashio::log.info "Starting vmagent..."
bashio::log.info "Scrape config: ${CONFIG_FILE}"
bashio::log.info "Remote write URL: ${REMOTE_URL}"

if [ ! -f "${CONFIG_FILE}" ]; then
  bashio::log.warning "Scrape config not found at ${CONFIG_FILE}, creating default..."
  cat <<EOF > ${CONFIG_FILE}
global:
  scrape_interval: 15s
scrape_configs:
  - job_name: 'homeassistant'
    static_configs:
      - targets: ['homeassistant:8123']
EOF
fi

exec /usr/local/bin/vmagent \
  -promscrape.config=${CONFIG_FILE} \
  -remoteWrite.url=${REMOTE_URL} \
  -httpListenAddr=:8429
