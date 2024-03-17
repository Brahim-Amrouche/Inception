FROM debian:bullseye-20240311

#update repostiories
RUN apt-get update -y && apt-get upgrade  -y

#installing curl gnupg
RUN apt-get install curl lsb-release apt-transport-https ca-certificates -y

#update php  ppa repository for apt-get 
#RUN apt-get install software-properties-common -y && \
    #add-apt-repository ppa:ondrej/php

RUN curl -sSL -o /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

#update again the local repos , so i could install latest versions of php
RUN apt-get update -y

RUN apt-get install php8.2 php8.2-fpm php8.2-mysql -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

CMD ["bash"]
