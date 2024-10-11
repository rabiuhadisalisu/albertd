# Base image for PHP and Apache
FROM php:8.1-apache

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the files to the deployment.
COPY ./deviceservices /var/www/html/deviceservices
COPY ./index.php /var/www/html/index.php
COPY ./.htaccess /var/www/html/deviceservices/.htaccess

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
