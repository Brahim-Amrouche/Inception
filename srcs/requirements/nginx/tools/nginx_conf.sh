#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CERTIFICATE_KEY_PATH -out $CERTIFICATE_PATH

nginx -g 'daemon off;'
