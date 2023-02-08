FROM debian:buster

RUN apt update && apt install -y \
    curl \
    nano \
    nginx \
    openssl
RUN curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/public.crt -subj "/C=42/ST=SP/L=SP/O=Global Security/OU=Inception/CN=dmoreira.42.com"
COPY ./requirements/nginx/conf/nginx.conf /etc/nginx
EXPOSE 443
CMD "nginx" "-g" "daemon off;"