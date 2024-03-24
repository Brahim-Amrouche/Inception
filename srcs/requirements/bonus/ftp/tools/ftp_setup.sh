#!/bin/bash

useradd -m $FTP_USER
echo "$FTP_USER:$FTP_USER_PASSWORD" | chpasswd
chown $FTP_USER:$FTP_USER -R /home/$FTP_USER
echo "$FTP_USER" >> /etc/vsftpd.userlist

#sleep 10

chmod 775 -R /var/www/wordpress
chown $FTP_USER:$FTP_USER -R /var/www/wordpress

service vsftpd stop

/usr/sbin/vsftpd
