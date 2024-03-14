FROM debian:bullseye-20240311

#update repostiories
RUN apt-get update -y && apt-get upgrade  -y
    
#install curl as it will be needed
RUN apt-get install curl -y

#install systemd for managing services and daemons
#RUN apt-get install systemd -y

#curl the mariadb repository to get the latest stable mariabd    
RUN curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | bash -s -- --mariadb-server-version=11.3
#update repostiories again
RUN apt-get update -y && apt-get upgrade -y

#install mariadb
RUN apt-get install mariadb-server  mariadb-client -y

RUN service mariadb start || true

RUN mariadb-admin root create inception || true

#USER mysql

EXPOSE 3306

#CMD ["/bin/bash"]

