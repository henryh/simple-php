FROM php:8.3-fpm

RUN apt-get update && \
        apt-get install -y --no-install-recommends \
        curl \
        zip unzip libzip-dev \
        vim nano
RUN docker-php-ext-install zip pdo_mysql
RUN apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
COPY /config/ /usr/local/etc/php/conf.d/

EXPOSE 9000
ENTRYPOINT ["php", "-S", "0.0.0.0:9000", "-t", "/var/www/public"]
