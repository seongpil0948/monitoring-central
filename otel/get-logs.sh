docker logs -n 100 otel-collector > otel-collector.log 2>&1
docker logs -n 100 grafana-loki > loki.log 2>&1
docker logs -n 100 grafana-tempo-1 > tempo.log 2>&1