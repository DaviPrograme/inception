#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
    service mysql start && mysql -e \
    "CREATE USER 'wordpress'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
    CREATE DATABASE wordpress; \
    GRANT ALL ON wordpress.* TO 'wordpress'@'%';"
    chmod -R 777 /var/lib/mysql/wordpress
    service mysql start && mysql wordpress < wordpress.sql
    chown -R mysql:mysql /var/run/mysqld
    mv wordpress.sql /var/lib/mysql/wordpress
fi
