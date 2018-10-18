#! /bin/sh

docker run -dit -p 80:8080 --name terna-backend-devenv -h terna-backend-devenv -v terna-backend-devenv_volume:/root/workspaces -v terna-backend-devenv_volume_domains:/home/weblogic/wls12210/user_projects --device=/dev/dri/card0:/dev/dri/card0:rw -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=:0 -v /etc/localtime:/etc/localtime:ro lucianozu/terna-backend-devenv

