# Base image for PHP and Apache
FROM php:8.2-apache

# Set the working directory inside the container
# WORKDIR /var/www/html
# Enable mod_rewrite
RUN a2enmod rewrite

# Copy the files to the deployment.
COPY ./deviceservices /var/www/html/deviceservices
COPY ./index.php /var/www/html/index.php
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf


RUN chmod -R 777 /var/www/html

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
