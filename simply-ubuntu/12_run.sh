#! /bin/sh

docker run -dit \
--name simply-ubuntu -h simply-ubuntu \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
-v /home/zu/shared:/home/luke/shared:rw \
--device=/dev/dri/card0:/dev/dri/card0:rw \
-e DISPLAY=:0 \
lucianozu/simply-ubuntu

