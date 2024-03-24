FROM debian:bullseye-20240311

RUN apt-get update -y && apt-get upgrade -y

RUN apt install curl gnupg2 ca-certificates lsb-release debian-archive-keyring openssl gettext -y

RUN curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
  
RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
    http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    | tee /etc/apt/sources.list.d/nginx.list

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install nginx

ARG WORDPRESS_URL
ENV WORDPRESS_URL=${WORDPRESS_URL}
ARG CERTIFICATE_PATH
ENV CERTIFICATE_PATH=${CERTIFICATE_PATH}
ARG CERTIFICATE_KEY_PATH
ENV CERTIFICATE_KEY_PATH=${CERTIFICATE_KEY_PATH}
ARG STATIC_WEB_URL
ENV STATIC_WEB_URL=${STATIC_WEB_URL}
ARG ADMINER_URL
ENV ADMINER_URL=${ADMINER_URL}

COPY ./conf/template_conf  /etc/nginx/conf.d/template_conf
COPY ./tools/nginx_conf.sh /home/nginx_conf.sh


RUN chmod u+x /home/nginx_conf.sh && \
    mkdir -p /var/www/wordpress

EXPOSE 443

CMD /home/nginx_conf.sh
