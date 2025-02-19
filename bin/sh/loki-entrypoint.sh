
mkdir -p /loki/wal /loki/index /loki/boltdb-cache /loki/chunks /loki/compactor

exec loki -config.file=/etc/loki/local-config.yaml