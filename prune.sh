docker swarm leave --force
docker rm stack-generator-1
docker volume prune --all
docker volume prune -f
