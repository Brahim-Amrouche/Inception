FROM debian:bullseye-20240311

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install build-essential curl -y

WORKDIR /home

RUN curl redis-stable.tar.gz https://download.redis.io/redis-stable.tar.gz > redis-stable.tar.gz && \
    tar xzf redis-stable.tar.gz

WORKDIR /home/redis-stable

COPY ./conf/redis.conf /home/redis-stable/redis.conf

RUN make && make install

EXPOSE 6379

CMD redis-server /home/redis-stable/redis.conf
