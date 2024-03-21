FROM debian:bullseye-20240311

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install build-essential curl -y

WORKDIR /home

RUN curl redis-stable.tar.gz https://download.redis.io/redis-stable.tar.gz > redis-stable.tar.gz && \
    tar xzf redis-stable.tar.gz

WORKDIR /home/redis-stable

COPY ./conf/redis.conf /home/redis-stable/redis.conf

RUN make && make install

ARG REDIS_AUTH_PASSWORD

RUN sed -i "s/# requirepass foobared/requirepass ${REDIS_AUTH_PASSWORD}/" redis.conf

EXPOSE 6379

CMD redis-server
