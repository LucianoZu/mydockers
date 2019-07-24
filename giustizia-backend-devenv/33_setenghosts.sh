#! /bin/sh

docker exec -u 0 -i giustizia-backend-devenv tee -a /etc/hosts < hosts_eng
