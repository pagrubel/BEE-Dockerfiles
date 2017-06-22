from ubuntu:14.04
#proxy for LANL
ENV http_proxy=http://proxyout.lanl.gov:8080
ENV https_proxy=http://proxyout.lanl.gov:8080

#RUN sed -ri 's/bin\/sh/bin\/bash/' /etc/default/useradd
RUN apt-get -y update
RUN apt-get -y install emacs24 openssh-client openssh-server gcc g++ gfortran build-essential
RUN groupadd -r albuntu && useradd -r -m -g albuntu albuntu -s /bin/bash


#Install SSH
#RUN apt-get -y install openssh-client
#RUN apt-get -y install openssh-server
RUN mkdir /var/run/sshd
RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd
RUN mkdir /home/albuntu/.ssh/
COPY id_rsa /home/albuntu/.ssh/
COPY id_rsa.pub /home/albuntu/.ssh/
COPY config /home/albuntu/.ssh/
RUN chown -R albuntu:albuntu /home/albuntu/.ssh; chmod 0700 /home/albuntu/.ssh; chmod 0600 /home/albuntu/.ssh/*
RUN cat /home/albuntu/.ssh/id_rsa.pub >> /home/albuntu/.ssh/authorized_keys
RUN chown -R albuntu:albuntu /home/albuntu

#Install MPI
#RUN apt-get -y install gcc
#RUN apt-get -y install g++
#RUN apt-get -y install gfortran
#RUN apt-get -y install build-essential
RUN wget http://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz
RUN tar -xzf mpich-3.2.tar.gz
RUN cd ./mpich-3.2 && ./configure && make -j 8 && make install
#RUN cd ./mpich-3.2 && make -j 8
#RUN cd ./mpich-3.2 && make install
ENV PATH=$PATH:/usr/local/bin
#ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
#COPY .profile /home/albuntu/

#RUN cd ./openmpi-1.8.8/examples && make

#RUN update-rc.d ssh defaults

#USER root 
#COPY start_sshd.sh /
#RUN chmod 700 start_sshd.sh
#CMD ["/start_sshd.sh"]

USER root
WORKDIR /home/albuntu

