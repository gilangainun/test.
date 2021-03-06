FROM php:7.2-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev libfreetype6-dev libpng-dev libjpeg62-turbo-dev \
    && pecl install mcrypt-1.0.3 \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install pdo_mysql mysqli mbstring gd zip \
    && docker-php-ext-enable mcrypt

RUN apt-get install -y git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer config --global github-oauth.github.com 5b2d0a11dec5173fded41f915937a35d2697079a

WORKDIR /var/www