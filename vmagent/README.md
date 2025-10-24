# VictoriaMetrics vmagent (Home Assistant Add-on)

This add-on runs [vmagent](https://docs.victoriametrics.com/vmagent.html) inside Home Assistant.

## Features
- Runs vmagent as a background service.
- Can scrape Prometheus endpoints (including Home Assistant’s own).
- Can remote_write to a VictoriaMetrics instance.

## Configuration

Example config:

```yaml
remote_write_url: "http://victoriametrics:8428/api/v1/write"
scrape_config: "/config/vmagent_scrape.yml"
