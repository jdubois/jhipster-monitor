#!/usr/bin/env bash

echo "Waiting for Elasticsearch to startup (max 5min)"

NOW=$(date +%s)
while (( $(date +%s) - NOW < 300 )); do
    status_code=$(curl -m 10 -so "/dev/null" -w "%{http_code}" "${ELASTICSEARCH_URL}/_cluster/health?wait_for_status=yellow&timeout=5s") &&
        [ "$status_code" == "200" ] && echo "" && echo "Importing dashboards" && exit 0
    sleep 1
done

exit 1
