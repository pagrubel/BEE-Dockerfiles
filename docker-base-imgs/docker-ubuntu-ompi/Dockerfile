#from ubuntu:14.04
FROM ubuntu:16.04
#proxy for LANL
ENV http_proxy=http://proxyout.lanl.gov:8080
ENV https_proxy=http://proxyout.lanl.gov:8080

#set docker's UID/GID to be same as vm and host for dir sharing
#when build, append: "--build-arg uid=$(id -u),gid=$(id -g)"
#ARG uid=1000
#ARG gid=1000

#RUN echo $uid
#RUN echo $gid

USER root

RUN apt-get -y update
RUN apt-get -y install \
    emacs24 \
    openssh-client \
    openssh-server \
    gcc \
    g++ \
    build-essential \
    autoconf \
    cmake \
    git \
    gfortran \
    libtool \
    libva-dev \
    pkg-config \
    python \
    python-dev \
    python-pip \
    xutils-dev \
    wget

#RUN groupadd -r albuntu -g $gid && useradd -r -m -g albuntu -u $uid albuntu -s /bin/bash

RUN useradd -ms /bin/bash  beeuser
 


#Install SSH
RUN mkdir /var/run/sshd
RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd

RUN mkdir /home/beeuser/.ssh/
COPY id_rsa /home/beeuser/.ssh/
COPY id_rsa.pub /home/beeuser/.ssh/
COPY config /home/beeuser/.ssh/
RUN chmod 0700 /home/beeuser/.ssh; chmod 0600 /home/beeuser/.ssh/*
RUN cat /home/beeuser/.ssh/id_rsa.pub >> /home/beeuser/.ssh/authorized_keys
RUN sed -i 's/Port 22/Port 9222/' /etc/ssh/sshd_config
RUN chown -R beeuser:beeuser /home/beeuser/.ssh

#Install MPI
RUN wget https://www.open-mpi.org/software/ompi/v2.0/downloads/openmpi-2.0.2.tar.gz
RUN tar -xzf openmpi-2.0.2.tar.gz
RUN cd ./openmpi-2.0.2 && ./configure CC=gcc CXX=g++ FC=gfortran && make -j 8 all && make install
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

#if use /bin/sh
#COPY .profile /home/albuntu/

#if use /bin/bash
RUN (echo "LD_LIBRARY_PATH=/usr/local/lib"; echo "") >> /etc/environment

#RUN cd ./openmpi-2.0.2/examples && make

RUN mkdir /mnt/docker_share
RUN chown -R beeuser:beeuser /mnt


