#! /bin/sh

docker run -dit -p 7001:7001 \
--name terna-backend-devenv -h terna-backend-devenv \
-v terna-backend-devenv_volume:/home/weblogic/workspaces \
-v terna-backend-devenv_volume_domains:/home/weblogic/wls12210/user_projects \
-v $HOME/.m2/repository:/home/weblogic/.m2/repository:rw \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
--device=/dev/dri/card0:/dev/dri/card0:rw \
-e DISPLAY=:0 \
lucianozu/terna-backend-devenv

