#! /bin/sh

docker run -dit -p 7001:7001 -p 8080:8080 \
--name giustizia-backend-devenv -h giustizia-backend-devenv \
-v giustizia-backend-devenv_volume_workspaces:/home/developer/workspaces \
-v giustizia-backend-devenv_volume_domains:/home/developer/wls12210/user_projects \
-v giustizia-backend-devenv_volume_jboss:/home/developer/jboss-4.2.3.GA/server \
-v giustizia-backend-devenv_volume_apache:/home/developer/apache-tomcat-8.5.43 \
-v $HOME/.m2/repository:/home/developer/.m2/repository:rw \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
--device=/dev/dri/card0:/dev/dri/card0:rw \
-e DISPLAY=:0 \
lucianozu/giustizia-backend-devenv
