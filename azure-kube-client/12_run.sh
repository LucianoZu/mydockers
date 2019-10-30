#! /bin/sh

docker run -dit -p 80:80 \
--name azure-kube-client -h azure-kube-client \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
--device=/dev/dri/card0:/dev/dri/card0:rw \
-e DISPLAY=:0 \
lucianozu/azure-kube-client

