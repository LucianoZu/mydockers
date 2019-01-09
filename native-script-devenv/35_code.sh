#! /bin/sh

xhost + local:docker
docker exec -d native-script-devenv code
