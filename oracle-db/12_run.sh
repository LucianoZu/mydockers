#! /bin/sh

docker run -dit -p 1521:1521 -e ORACLE_PASSWORD=tisfido111 \
--name oracle -h oracle \
-v $HOME/oradata:/opt/oracle/oradata \
gvenzl/oracle-xe:21.3.0

