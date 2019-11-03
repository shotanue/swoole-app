FROM php:7.3-cli-alpine3.10 AS build-extensions

RUN apk add --update --no-cache autoconf make g++ gcc php7-dev

RUN pecl install swoole xdebug


ENTRYPOINT ["php"]
CMD ["-m"]

#############################################
FROM php:7.3-cli-alpine3.10 AS ship

COPY --from=build-extensions  /usr/local/lib/php/extensions/no-debug-non-zts-20180731/swoole.so \
                              /usr/local/lib/php/extensions/no-debug-non-zts-20180731/swoole.so

# swoole requires libstdc++
RUN apk add --update --no-cache libstdc++ \
 && docker-php-ext-enable swoole


#############################################
FROM ship AS ship-dev

COPY --from=build-extensions /usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so \
                             /usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so

RUN docker-php-ext-enable xdebug
