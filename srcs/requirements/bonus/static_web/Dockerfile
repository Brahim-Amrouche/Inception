FROM debian:bullseye-20240311

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install curl xz-utils -y

WORKDIR /home

RUN curl -O https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.xz && \ 
    tar -xf ./node-v20.11.1-linux-x64.tar.xz && \
    echo "export PATH=/home/node-v20.11.1-linux-x64/bin:$PATH" >> /root/.bashrc && \
    ln -s /home/node-v20.11.1-linux-x64/bin/node /usr/bin/node && \
    ln -s /home/node-v20.11.1-linux-x64/bin/npm /usr/bin/npm && \
    mkdir -p /var/static_web 

WORKDIR /var/static_web

EXPOSE 3000

CMD npm run dev
