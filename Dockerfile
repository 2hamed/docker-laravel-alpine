FROM alpine:3.7

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub


RUN apk --update add ca-certificates

RUN echo "@php http://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories
<<<<<<< HEAD

# ENV http_proxy http://vpn.putech.ir:3247
# ENV https_proxy http://vpn.putech.ir:3247
=======
>>>>>>> 5c00894730dc02fbd08166d932534e6a9a8919d4

RUN apk update

RUN apk add --update bash
<<<<<<< HEAD
RUN apk add --update supervisor
=======
RUN apk add --update git
RUN apk add --update htop
RUN apk add --update openssh
>>>>>>> 5c00894730dc02fbd08166d932534e6a9a8919d4
RUN apk add --update php@php
RUN apk add --update php-mbstring@php
RUN apk add --update php-zip@php
RUN apk add --update php-xml@php
RUN apk add --update php-pdo@php
RUN apk add --update php-mysqli@php
RUN apk add --update php-pgsql@php
RUN apk add --update php-phar@php
RUN apk add --update php-soap@php
RUN apk add --update php-curl@php
RUN apk add --update php-bcmath@php
RUN apk add --update php-redis@php
RUN apk add --update php-mongodb@php
RUN apk add --update php-fpm@php
RUN apk add --update php-openssl@php
RUN apk add --update php-zlib@php
RUN apk add --update php-dom@php
RUN apk add --update php-pdo_pgsql@php
RUN apk add --update php-ctype@php
RUN apk add --update php-gd@php
RUN apk add --update supervisor

RUN sed -i 's/post_max_size = 8M/post_max_size = 50M/g' /etc/php7/php.ini
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 50M/g' /etc/php7/php.ini

RUN ln -s /usr/bin/php7 /usr/bin/php

WORKDIR /app

COPY ./composer-setup.sh /app/composer-setup.sh

RUN chmod +x /app/composer-setup.sh

RUN ./composer-setup.sh

RUN mv /app/composer.phar /bin/composer

RUN composer global require "laravel/installer"