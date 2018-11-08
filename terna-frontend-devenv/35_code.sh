#! /bin/sh

xhost + local:docker
docker exec -it terna-frontend-devenv code
