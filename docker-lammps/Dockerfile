FROM centos:7
RUN yum -y update
RUN yum -y group install "Development Tools"
RUN yum -y install openmpi-devel openssh-server
#RUN yum -y install git make
RUN git clone https://github.com/lammps/lammps.git
WORKDIR lammps/src
ENV PATH=$PATH:/usr/lib64/openmpi/bin/
RUN make -j4 mpi
#ENTRYPOINT /bin/bash


USER root

# follow instructions in https://github.com/docker/docker/issues/5663
RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd

# setup ssh keys and config
COPY id_rsa /root/.ssh/
COPY id_rsa.pub /root/.ssh/
COPY config /root/.ssh/
RUN chmod 0700 /root/.ssh; chmod 0600 /root/.ssh/*
RUN sed -i 's/Port 22/Port 9222/' /etc/ssh/sshd_config

# add no password login
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

RUN mkdir /var/run/sshd