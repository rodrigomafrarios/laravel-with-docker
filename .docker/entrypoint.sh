#! /bin/bash
chown -R www-data:www-data storage/
chmod 777 -R storage/
composer.phar install
php artisan migrate
php artisan key:generate
php artisan config:cache
php-fpm
