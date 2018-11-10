#! /bin/sh

docker run -dit -p 4662:4662 -p 4665:4665 -p 4672:4672 -p 80:80 -p 4711:4711 -p 4712:4712 \
--name adunanza -h adunanza \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
-v $HOME/.aMuleAdunanzA:/home/adunanza/.aMuleAdunanzA:rw \
--device=/dev/dri/card0:/dev/dri/card0:rw \
-e DISPLAY=:0 \
lucianozu/adunanza

