#! /bin/sh

xhost + local:docker
docker exec -d thunderbird thunderbird
