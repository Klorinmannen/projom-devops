FROM php:8.2-fpm-alpine

RUN apk add icu-dev && docker-php-ext-configure intl
RUN docker-php-ext-install pdo pdo_mysql mysqli intl

EXPOSE 9000

CMD ["php-fpm"]
