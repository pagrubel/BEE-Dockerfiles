FROM pagrubel/ubuntu-ompi-beeuser

#ENV http_proxy=
#ENV https_proxy=

RUN apt-get update
RUN apt-get install build-essential
WORKDIR /home/beeuser
USER beeuser

RUN git clone https://github.com/lammps/lammps.git
WORKDIR /home/beeuser/lammps/src
ENV PATH=$PATH:/usr/lib64/openmpi/bin/
RUN make -j16 mpi

