#! /bin/sh

xhost + local:docker
docker exec -u 0 -it native-script-devenv bash
