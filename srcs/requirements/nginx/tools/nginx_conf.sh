#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CERTIFICATE_KEY_PATH -out $CERTIFICATE_PATH -subj "/C=ma/ST=Rhamna/L=Benguerir/O=1337/CN=$WORDPRESS_URL"


export SCRIPTS_PATH='$document_root$fastcgi_script_name'
export ARGS='$args'
export URI='$uri'

envsubst < /etc/nginx/conf.d/template_conf > /etc/nginx/conf.d/defaul.conf


nginx -g 'daemon off;'
