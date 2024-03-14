FROM debian:bullseye-20240311

#update repostiories
RUN apt-get update -y && apt-get upgrade  -y
    
#install curl as it will be needed
RUN apt-get install curl -y

#curl the mariadb repository to get the latest stable mariabd    
RUN curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | bash -s -- --mariadb-server-version=11.3
#update repostiories again
RUN apt-get update -y && apt-get upgrade -y

#install mariadb
RUN apt-get install mariadb-server  mariadb-client -y

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mariadb restart

RUN mariadb-admin create inception || true

#ENV MARIADB_ROOT_PASSWORD=$MARIADB_ROOT_PASSWORD
#ENV MARIADB_USER
#ENV MARIADB_USER_PASSWORD

#RUN mariadb -e "UPDATE mysql.user SET Password = PASSWORD('${MARIADB_ROOT_PASSWORD}') WHERE User = 'root'"


#USER mysql

EXPOSE 3306

CMD ["bash", "-c", ""]

