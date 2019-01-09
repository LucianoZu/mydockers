#! /bin/sh

docker run --privileged -dit -p 4200:4200 \
--name native-script-devenv -h native-script-devenv \
-v native-script-devenv_volume_workspaces:/home/vscode/workspaces \
-v native-script-devenv_volume_global:/home/vscode/global \
-v native-script-devenv_volume_android:/home/vscode/android \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
--device=/dev/dri/card0:/dev/dri/card0:rw \
--device=/dev/kvm:/dev/kvm:rw \
-e DISPLAY=:0 \
lucianozu/native-script-devenv

