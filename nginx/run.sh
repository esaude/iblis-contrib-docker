#!/bin/sh
set -ex

cd /usr/share/nginx/html/

# Install PHP dependencies
composer install

# Create database tables (appears to be idempotent)
echo "yes" | php artisan migrate

# Add dummy data (kind of idempotent)
echo "yes" | php artisan db:seed || true

# Fix log permissions
chown nginx:nginx /usr/share/nginx/html/app/storage/logs/laravel.log

# start processes
php-fpm
nginx
