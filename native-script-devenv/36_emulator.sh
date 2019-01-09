#! /bin/sh

xhost + local:docker
docker exec -u 0 -d native-script-devenv emulator -avd test
