#! /bin/sh

docker run -dit -p 4200:4200 \
--name terna-frontend-devenv -h terna-frontend-devenv \
-v terna-frontend-devenv_volume:/home/vscode/workspaces \
-v terna-frontend-devenv_volume_global:/home/vscode/global \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
--device=/dev/dri/card0:/dev/dri/card0:rw \
-e DISPLAY=:0 \
lucianozu/terna-frontend-devenv

