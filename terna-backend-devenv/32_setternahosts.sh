#! /bin/sh

docker exec -u 0 -i terna-backend-devenv tee -a /etc/hosts < hosts_terna
