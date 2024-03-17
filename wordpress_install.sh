#!/bin/bash

wp --allow-root config create --dbname=Test --dbuser=bamrouch --dbpass=adm123 --dbhost=mariadb:3306 --dbcharset=utf8mb4
wp --allow-root core install --url=test.com --title=Test --admin_user=bamrouch_admin --admin_password=adm123 --admin_email=amroucheb4@gmail.com

