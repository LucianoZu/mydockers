#! /bin/sh

xhost + local:docker
docker exec -u 0 -it dart-devenv bash
