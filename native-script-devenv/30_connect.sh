#! /bin/sh

xhost + local:docker
docker exec -it native-script-devenv bash
