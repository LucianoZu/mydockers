#! /bin/sh

xhost + local:docker
docker exec -it terna-backend-devenv eclipse
