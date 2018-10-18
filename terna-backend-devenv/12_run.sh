#! /bin/sh

docker run -dit -p 7001:7001 \
--name terna-backend-devenv -h terna-backend-devenv \
-v terna-backend-devenv_volume:/root/workspaces \
-v terna-backend-devenv_volume_domains:/home/weblogic/wls12210/user_projects \
-v $HOME/.m2/repository:/root/.m2/repository:rw \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /etc/localtime:/etc/localtime:ro \
--device=/dev/dri/card0:/dev/dri/card0:rw \
-e DISPLAY=:0 \
lucianozu/terna-backend-devenv

