#! /bin/sh

docker run --privileged -dit -p 8080:8080 \
--name dart-devenv -h dart-devenv \
-v dart-devenv_volume_workspaces:/home/developer/workspaces \
-v dart-devenv_volume_pub-cache:/home/developer/.pub-cache \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
--device=/dev/dri/card0:/dev/dri/card0:rw \
-e DISPLAY=:0 \
lucianozu/dart-devenv

