#! /bin/sh

xhost + local:docker
docker exec -d terna-backend-devenv eclipse
