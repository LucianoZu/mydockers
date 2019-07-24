#! /bin/sh

xhost + local:docker
docker exec -d giustizia-backend-devenv eclipse
