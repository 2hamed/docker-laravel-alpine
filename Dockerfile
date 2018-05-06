# change to Alpine 3.6 you like.
FROM alpine:3.7

# trust this project public key to trust the packages.
ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

## you may join the multiple run lines here to make it a single layer

# make sure you can use HTTPS
RUN apk --update add ca-certificates

# add the repository, make sure you replace the correct versions if you want.
RUN echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories

# install php and some extensions
# notice the @php is required to avoid getting default php packages from alpine instead.
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

