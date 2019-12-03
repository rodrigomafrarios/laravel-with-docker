FROM php:7.3.6-fpm-alpine3.9 as builder
RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

RUN apk add --no-cache openssl

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin

RUN composer install

#removes html path
RUN rm -rf /var/www/html

#symbolic link from public to html
RUN ln -s public html

#copying all files
COPY . /var/www

RUN apk add --no-cache npm

#FROM php:7.3.6-fpm-alpine3.9
#RUN apk add bash --no-cache mysql-client
#RUN docker-php-ext-install pdo pdo_mysql

#WORKDIR /var/www

#removes html path
#RUN rm -rf /var/www/html

#create an brand new image
#COPY --from=builder /var/www .

ENTRYPOINT ["php-fpm"]

