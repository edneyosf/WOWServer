FROM ubuntu:22.04

RUN apt update
RUN apt install -y libmysqlclient-dev mysql-client git clang nano cmake make gcc g++ libssl-dev libbz2-dev libreadline-dev libncurses-dev libboost-all-dev

RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100