#! /bin/sh

docker run -dit \
--name oracle-data-modeler -h oracle-data-modeler \
-v oracle-data-modeler_volume_models:/home/developer/models \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
--device=/dev/dri/card0:/dev/dri/card0:rw \
-e DISPLAY=:0 \
lucianozu/oracle-data-modeler
