FROM php:7.4-cli-alpine

WORKDIR /var/app

RUN apk add autoconf gcc g++ make git
RUN git clone https://github.com/nikic/php-ast.git -b v1.0.10 \
    && cd php-ast \
    && phpize \
    && ./configure \
    && make install \
    && echo 'extension=ast.so' > /usr/local/etc/php/php.ini

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

COPY src ./src/
COPY check.sh ./
COPY composer.json ./

ENTRYPOINT ["/var/app/test.sh"]