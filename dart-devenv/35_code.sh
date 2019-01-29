#! /bin/sh

xhost + local:docker
docker exec -d dart-devenv code
