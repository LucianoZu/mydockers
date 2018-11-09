#! /bin/sh

xhost + local:docker
docker exec -d terna-frontend-devenv code
