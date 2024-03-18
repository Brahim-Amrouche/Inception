#!/bin/bash

echo ">> Configuring Wordpress <<" 
wp --allow-root config create --dbname="$sql_db_name" --dbuser="$mariadb_user" --dbpass="$mariadb_user_password" --dbhost=mariadb:3306 --dbcharset=utf8mb4

echo ">> Installing Wordpress <<"
wp --allow-root core install --url="$wordpress_url" --title="$wordpress_website_title" --admin_user="$wordpress_admin_user" --admin_password="$wordpress_admin_password" --admin_email="$wordpress_admin_email"

echo ">> Wordpress Finished Installing <<"

echo ">> Launching php-fpm <<"
php-fpm8.2
