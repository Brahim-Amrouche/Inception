FROM debian:bullseye-20240311

RUN apt-get update && apt-get upgrade -y

RUN apt-get install curl lsb-release apt-transport-https ca-certificates -y

RUN curl -sSL -o /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

#update again the local repos , so i could install latest versions of php
RUN apt-get update -y && \
    apt-get install php8.2 php8.2-mysql -y && \
    mkdir -p /var/adminer

WORKDIR /var/adminer

RUN curl -Lo index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

EXPOSE 8080

CMD php -S "0.0.0.0:8080" -t /var/adminer
