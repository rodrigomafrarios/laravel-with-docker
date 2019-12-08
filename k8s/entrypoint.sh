#! /bin/bash
chown -R www-data:www-data storage
chmod 777 -R storage
php artisan migrate
php artisan config:cache
php-fpm
