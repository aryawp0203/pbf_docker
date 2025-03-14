# Gunakan PHP-FPM sebagai base image
FROM php:8.2-fpm

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    nginx libicu-dev libpng-dev libjpeg-dev libfreetype6-dev zip unzip supervisor \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql mysqli intl \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy project files (excluding via .dockerignore)
COPY ./src /var/www

# Copy konfigurasi Nginx
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy konfigurasi supervisord
COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Ensure proper permissions
RUN chown -R www-data:www-data /var/www && chmod -R 755 /var/www

# Expose port 80
EXPOSE 80

# Start supervisord untuk menjalankan PHP-FPM & Nginx secara bersamaan
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]