FROM cjy7117/ubuntu-ompi

ENV http_proxy=
ENV https_proxy=

RUN apt-get update
RUN apt-get install build-essential

RUN git clone https://github.com/lammps/lammps.git
WORKDIR lammps/src
#ENV PATH=$PATH:/usr/lib64/openmpi/bin/
#RUN make -j4 mpi
#ENTRYPOINT /bin/bash


USER root
