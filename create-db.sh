#!/bin/bash

#---------------------------------------------------------------------
# Settings
#---------------------------------------------------------------------

DB_NAME=dbname
DB_USER=username
MYSQL_ROOT_PASSWORD=root_password
DB_PASSWORD=user_password

#--------------------------------------------------------------------
# End settings
#--------------------------------------------------------------------

# Создаем БД, пользователя и права
docker exec -i mysql-docker /usr/bin/mysql -u root --password=$MYSQL_ROOT_PASSWORD <<< "CREATE DATABASE $DB_NAME DEFAULT CHARSET utf8;"
docker exec -i mysql-docker /usr/bin/mysql -u root --password=$MYSQL_ROOT_PASSWORD <<< "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'127.0.0.1' IDENTIFIED BY '$DB_PASSWORD';"
docker exec -i mysql-docker /usr/bin/mysql -u root --password=$MYSQL_ROOT_PASSWORD <<< "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
docker exec -i mysql-docker /usr/bin/mysql -u root --password=$MYSQL_ROOT_PASSWORD <<< "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
docker exec -i mysql-docker /usr/bin/mysql -u root --password=$MYSQL_ROOT_PASSWORD <<< "show databases;"

