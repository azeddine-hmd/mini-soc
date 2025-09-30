#!/bin/sh

echo "Execute native entrypoint..."
chmod +x /entrypoint.sh
/entrypoint.sh

echo "Setting proper permissions on certificate directory..."
echo "UID: ${MY_UID} and GID ${MY_GID}"
chmod -R 600 /certificates/
chown -R $MY_UID:$MY_GID /certificates/
