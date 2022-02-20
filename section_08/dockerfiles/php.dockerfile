FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

COPY src .

RUN docker-php-ext-install pdo pdo_mysql
# 'docker-php-ext-install' is the name of a tool, that helps us here to install the two PHP
# extensions: 'pdo' and 'pdo_mysql'

RUN chown -R www-data:www-data /var/www/html

# If we don't have any CMD (command) or ENTRYPOINT at the end of the Dockefile, then the
# the default command of base image will be executed, if it has any.
