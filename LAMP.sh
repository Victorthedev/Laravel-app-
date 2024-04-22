#!/bin/bash

# Update packages
apt-get update

# Install Apache, MySQL, and PHP
apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql

# Clone the PHP application from GitHub
git clone https://github.com/laravel/laravel /var/www/html

# Configure Apache
a2enmod rewrite
sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf
service apache2 restart

# Configure MySQL
mysql -u root -e "CREATE DATABASE laravel;"
mysql -u root -e "GRANT ALL PRIVILEGES ON laravel.* TO 'root'@'localhost';"