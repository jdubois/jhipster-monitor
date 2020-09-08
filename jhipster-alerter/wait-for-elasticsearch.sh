#!/usr/bin/env bash

echo "Waiting for Elasticsearch to startup (max 5min)"

NOW=$(date +%s)
while (( $(date +%s) - NOW < 300 )); do
    status_code=$(curl -m 10 -so "/dev/null" -w "%{http_code}" "${ES_HOST}:${ES_PORT}/_cluster/health?wait_for_status=yellow&timeout=5s") &&
        [ "$status_code" == "200" ] && echo "" && exit 0
    sleep 1
done

exit 1
