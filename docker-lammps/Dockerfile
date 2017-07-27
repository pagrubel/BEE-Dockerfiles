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
RUN sed 's/#Port 22/Port 9222/g' /etc/ssh/sshd_config > /etc/ssh/sshd_config_new
RUN mv /etc/ssh/sshd_config_new /etc/ssh/sshd_config
RUN /bin/bash
