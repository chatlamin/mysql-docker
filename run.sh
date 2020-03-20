#!/bin/bash

#---------------------------------------------------------------------
# Settings
#---------------------------------------------------------------------

PATH_DATA='/home/docker/mysql-docker/data'
PATH_ETC='/home/docker/mysql-docker/etc'
MYSQL_ROOT_PASSWORD=root_password

#--------------------------------------------------------------------
#End settings
#--------------------------------------------------------------------

mkdir -p $PATH_ETC
cp my.cnf $PATH_ETC/my.cnf

docker run \
        --name mysql-docker \
        --detach \
        --restart=always \
        --volume /etc/localtime:/etc/localtime:ro \
        --volume /etc/timezone:/etc/timezone:ro \
        --volume $PATH_DATA:/var/lib/mysql \
        --volume $PATH_ETC/my.cnf:/etc/mysql/my.cnf \
        --env MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD" \
        --publish 3306:3306 \
        chatlamin/mysql-docker:latest

docker logs --follow mysql-docker