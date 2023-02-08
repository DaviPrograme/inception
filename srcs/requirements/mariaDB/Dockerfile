FROM debian:buster

ARG MYSQL_PASSWORD

RUN apt update && apt install -y \
    mariadb-server
COPY ./requirements/mariaDB/conf/wordpress.sql /
COPY ./requirements/mariaDB/tools/mariadb.sh /
RUN chmod 777 mariadb.sh
RUN chmod 777 wordpress.sql
RUN ./mariadb.sh
EXPOSE 3306
CMD ["mysqld", "--bind-address=0.0.0.0"]