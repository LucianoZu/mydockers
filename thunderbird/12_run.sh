#! /bin/sh

docker run -dit \
--name thunderbird -h thunderbird \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
-v $HOME/.thunderbird:/home/thunderbird/.thunderbird:rw \
--device=/dev/dri/card0:/dev/dri/card0:rw \
-e DISPLAY=:0 \
lucianozu/thunderbird

