FROM debian:bullseye-20240311

#update repostiories
RUN apt-get update -y && apt-get upgrade  -y

#installing curl and debian tools to add external packages
RUN apt-get install curl lsb-release apt-transport-https ca-certificates -y

RUN curl -sSL -o /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

#update again the local repos , so i could install latest versions of php
RUN apt-get update -y

#installing php8.2 and it's modules
RUN apt-get install php8.2 php8.2-fpm php8.2-mysql php8.2-redis -y

#installing the wp-cli to easily install wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
    
#directory where fpm search by default
WORKDIR /var/www/wordpress

#downloading the version of wordpress
RUN wp --allow-root core download --version=6.4.3

#Copy the installation script
COPY ./tools/wordpress_install.sh /home/wordpress_install.sh

#changing the script to become executable , and creating a directory that fpm will need
RUN chmod u+x /home/wordpress_install.sh && \
    mkdir /run/php/ && chown www-data:www-data /run/php && \
    chmod -R 775 /var/www/wordpress

#Copying configuration of fpm
COPY  ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./conf/php-fpm.conf /etc/php/8.2/fpm/php-fpm.conf

#to keep data untouched 
#VOLUME /var/www/wordpress

#opening the port 9000 to communicate with nginx
EXPOSE 9000

#variables needed in wordpress installation
ARG MARIADB_USER
ENV MARIADB_USER=${MARIADB_USER}
ARG MARIADB_USER_PASSWORD
ENV MARIADB_USER_PASSWORD=${MARIADB_USER_PASSWORD}
ARG SQL_DB_NAME
ENV SQL_DB_NAME=${SQL_DB_NAME}
ARG WORDPRESS_ADMIN_USER
ENV WORDPRESS_ADMIN_USER=${WORDPRESS_ADMIN_USER}
ARG WORDPRESS_ADMIN_PASSWORD
ENV WORDPRESS_ADMIN_PASSWORD=${WORDPRESS_ADMIN_PASSWORD}
ARG WORDPRESS_URL
ENV WORDPRESS_URL=${WORDPRESS_URL}
ARG WORDPRESS_WEBSITE_TITLE
ENV WORDPRESS_WEBSITE_TITLE=${WORDPRESS_WEBSITE_TITLE}
ARG WORDPRESS_ADMIN_EMAIL
ENV WORDPRESS_ADMIN_EMAIL=${WORDPRESS_ADMIN_EMAIL}
ARG REDIS_AUTH_PASSWORD
ENV REDIS_AUTH_PASSWORD=${REDIS_AUTH_PASSWORD}

CMD /home/wordpress_install.sh
