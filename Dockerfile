# Base image for PHP and Apache
FROM php:8.1-apache

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the files to the deployment.
COPY ./deviceservices /var/www/html/deviceservices
COPY ./index.php /var/www/html/index.php
COPY ./.htaccess /var/www/html/deviceservices/.htaccess

# Give appropriate permissions to the Apache web server for the 'deviceservices' directory
RUN chown -R www-data:www-data /var/www/html/deviceservices \
    && chmod -R 755 /var/www/html/deviceservices

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
