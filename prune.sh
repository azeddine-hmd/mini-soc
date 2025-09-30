#!/bin/sh

# BE CARFUL, VOLUMES WILL BE DELETE AS WELL!!

docker swarm leave --force
docker rm stack-generator-1
docker volume prune -a -f
