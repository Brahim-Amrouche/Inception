FROM debian:bullseye-20240311

RUN apt-get update -y && apt-get upgrade  -y && \
    apt-get install curl -y && \
    curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | bash && \
    apt-get update -y && apt-get upgrade -y && \
    apt-get install mariadb-server  mariadb-client -y
