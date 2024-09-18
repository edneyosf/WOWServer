FROM ubuntu:22.04

RUN apt update
RUN apt install -y libmysqlclient-dev mysql-client git nano libssl-dev libbz2-dev libreadline-dev libncurses-dev libboost-all-dev p7zip

RUN echo '#!/bin/sh\n\n./home/wow/server/bin/start-auth' > /usr/local/bin/start-auth
RUN chmod +x /usr/local/bin/start-auth

RUN echo '#!/bin/sh\n\n./home/wow/server/bin/start-world' > /usr/local/bin/start-world
RUN chmod +x /usr/local/bin/start-world
