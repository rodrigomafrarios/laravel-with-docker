FROM php:7.3.6-fpm-alpine3.9
RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www

#removes html path
RUN rm -rf /var/www/html

RUN sudo curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin

#RUN composer-install && \
 #   cp .env.example .env && \
  #  php artisan key:generate && \
   # php artisan config:cache


#copying all files
COPY . /var/www

#symbolic link from public to html
RUN ln -s public html

#EXPOSE 9000

ENTRYPOINT ["php-fpm"]

