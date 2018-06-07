FROM alpine:3.7

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub


RUN apk --update add ca-certificates

RUN echo "@php http://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories

RUN apk update

RUN apk add --update bash
RUN apk add --update git
RUN apk add --update htop
RUN apk add --update openssh
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

COPY ./composer-setup.sh ./

RUN chmod +x /app/composer-setup.sh

RUN ./composer-setup.sh

RUN mv /app/composer.phar /bin/composer

RUN composer global require "laravel/installer"