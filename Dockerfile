FROM debian:12.10-slim

RUN apt update
RUN apt install -y wget lsb-release gnupg

COPY mysql-apt-config_all.deb /tmp/mysql-apt-config_all.deb
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/mysql-apt-config_all.deb
RUN apt update
RUN apt install -y wget lsb-release gnupg git clang cmake make gcc g++ libmysqlclient-dev libssl-dev libbz2-dev libreadline-dev libncurses-dev libboost-all-dev p7zip

RUN echo '#!/bin/sh\n\n./home/wow/server/bin/start-auth' > /usr/local/bin/start-auth
RUN chmod +x /usr/local/bin/start-auth

RUN echo '#!/bin/sh\n\n./home/wow/server/bin/start-world' > /usr/local/bin/start-world
RUN chmod +x /usr/local/bin/start-world