#!/bin/bash

#source /etc/bash.bashrc

echo ">> Configuring Wordpress << $MARIADB_USER with password $MARIADB_USER_PASSWORD on table $SQL_DB_NAME" 

sleep 5

wp --allow-root config create --dbname=$SQL_DB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_USER_PASSWORD --dbhost=mariadb:3306 --dbcharset=utf8mb4

echo ">> Installing Wordpress << $WORDPRESS_URL with tile of $WORDPRESS_WEBSITE_TITLE and $WORDPRESS_ADMIN_USER with $WORDPRESS_ADMIN_PASSWORD and email of $WORDPRESS_ADMIN_EMAIL" 

wp --allow-root core install --url=$WORDPRESS_URL --title=$WORDPRESS_WEBSITE_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL


wp --allow-root user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD

wp --allow-root plugin install redis-cache --activate
wp --allow-root config set WP_REDIS_HOST "redis"
wp --allow-root config set WP_REDIS_PORT "6379"
wp --allow-root config set WP_CACHE true --raw
wp --allow-root redis flush
wp --allow-root redis enable

echo ">> Wordpress Finished Installing <<"

echo ">> Launching php-fpm <<"
php-fpm8.2
