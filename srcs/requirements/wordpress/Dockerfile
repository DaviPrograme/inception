FROM debian:buster

ARG MYSQL_PASSWORD

RUN apt update && apt install -y curl nano \
    php7.3 php7.3-phar php7.3-fpm php7.3-opcache \
    php7.3-cli php7.3-gd php7.3-curl php7.3-mysql php7.3-mbstring
RUN curl -O https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN mkdir -p /var/www/html
RUN mv wordpress /var/www/html/
RUN chown -R www-data:www-data /var/www/html/wordpress
RUN chmod -R 0777 /var/www/html/wordpress/wp-content/
COPY ./requirements/wordpress/conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./requirements/wordpress/conf/wp-config.php /var/www/html/wordpress
RUN sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wordpress/wp-config.php
RUN mkdir /run/php
EXPOSE 9000
CMD ["php-fpm7.3", "--nodaemonize"]