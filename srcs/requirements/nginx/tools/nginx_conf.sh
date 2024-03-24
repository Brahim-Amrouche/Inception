#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CERTIFICATE_KEY_PATH -out $CERTIFICATE_PATH -subj "/C=ma/ST=Rhamna/L=Benguerir/O=1337/CN=$WORDPRESS_URL"


export SCRIPTS_PATH='./$fastcgi_script_name'
export ARGS='$args'
export URI='$uri'
export STATIC_WEB_URL="static_web.fr"
export HOST='$host'
export REMOTE_ADDR='$remote_addr'
export PROXY_ADD_X_FORWARDED_FOR='$proxy_add_x_forwarded_for'
export SCHEME='$scheme'


envsubst < /etc/nginx/conf.d/template_conf > /etc/nginx/conf.d/default.conf


nginx -g 'daemon off;'
