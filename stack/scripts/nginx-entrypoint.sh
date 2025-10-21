#!/bin/bash

echo "running from custom entrypoint..."
chmod +x /docker-entrypoint.sh
/scripts/wait-for-it.sh wazuh-master 1514
/scripts/wait-for-it.sh wazuh-worker 1514
echo "All upstreams are reachable, starting native entrypoint..."
exec /docker-entrypoint.sh nginx -g "daemon off;"
