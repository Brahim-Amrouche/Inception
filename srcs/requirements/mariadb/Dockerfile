FROM debian:bullseye-20240311

#update repostiories
RUN apt-get update -y && apt-get upgrade  -y
    
#install curl as it will be needed
RUN apt-get install curl -y

#curl the mariadb repository to get the latest stable mariabd    
RUN curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | bash -s -- --mariadb-server-version=11.1
#update repostiories again
RUN apt-get update -y && apt-get upgrade -y

#install mariadb
RUN apt-get install mariadb-server  mariadb-client -y

#VOLUME /var/lib/mysql

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ARG MARIADB_ROOT_PASSWORD
ARG MARIADB_USER
ARG MARIADB_USER_PASSWORD
ARG SQL_DB_NAME

RUN service mariadb start && \
    mariadb-admin -u root password $MARIADB_ROOT_PASSWORD && \
    mariadb -e "CREATE DATABASE IF NOT EXISTS $SQL_DB_NAME;" && \
    mariadb -e "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD';" && \
    mariadb -e "GRANT ALL PRIVILEGES ON $SQL_DB_NAME.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD';" && \
    mariadb -e "FLUSH PRIVILEGES;"

USER mysql

EXPOSE 3306

CMD ["mariadbd"]

