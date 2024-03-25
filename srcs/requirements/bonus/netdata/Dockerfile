FROM debian:bullseye-20240311

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install curl -y

RUN curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh

EXPOSE 19999

CMD netdata -D
