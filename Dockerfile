FROM alpine:3.7

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub


RUN apk --update add ca-certificates

RUN echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories

RUN apk update

RUN apk add --update bash
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
RUN apk add --update git
RUN apk add --update htop
RUN apk add --update openssh
RUN apk add --update php-pdo_pgsql@php
RUN apk add --update php-ctype@php


RUN ln -s /usr/bin/php7 /usr/bin/php

WORKDIR /app

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN mv /app/composer.phar /bin/composer

RUN composer global require "laravel/installer"