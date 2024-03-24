FROM debian:bullseye-20240311

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install vsftpd -y

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY --chmod=775 ./tools/ftp_setup.sh /home/ftp_setup.sh

RUN mkdir -p /var/www/wordpress

ARG FTP_USER
ENV FTP_USER=${FTP_USER}
ARG FTP_USER_PASSWORD
ENV FTP_USER_PASSWORD=${FTP_USER_PASSWORD}

CMD /home/ftp_setup.sh
