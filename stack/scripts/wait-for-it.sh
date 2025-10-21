#!/bin/sh

host="$1"
port="$2"

# install netcat (debian based nginx)
if ! command -v nc >/dev/null 2>&1; then
	apt-get update && apt-get install -y netcat-openbsd
fi

# wait for Wazuh upstream to be ready
while ! nc -z "$host" "$port"; do
  echo "Waiting for $host:$port..."
  sleep 1
done

echo "Host $host:$port is ready!"
