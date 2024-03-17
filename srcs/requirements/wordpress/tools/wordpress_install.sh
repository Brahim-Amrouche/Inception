#!/bin/bash

echo ">> Configuring Wordpress <<" 
wp --allow-root config create --dbname=Test --dbuser=bamrouch --dbpass=adm123 --dbhost=mariadb:3306 --dbcharset=utf8mb4

echo ">> Installing Wordpress <<"
wp --allow-root core install --url=test.com --title=Test --admin_user=bamrouch_admin --admin_password=adm123 --admin_email=amroucheb4@gmail.com

echo ">> Wordpress Finished Installing <<"

echo ">> Launching php-fpm <<"
php-fpm8.2
