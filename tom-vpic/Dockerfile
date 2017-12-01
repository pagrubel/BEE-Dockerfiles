from cjy7117/pvcat2

RUN apt-get update

RUN apt-get -y install \
  vim\
  python-numpy\
  emacs24

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





WORKDIR /root

RUN git clone https://github.com/Tomyao/vpic.git

RUN mkdir /root/vpic.bin
WORKDIR /root/vpic.bin
RUN cmake \
    -DUSE_CATALYST=ON \
    -DCMAKE_BUILD_TYPE=Release \
    /root/vpic
RUN make -j16


# add the launcher scripts for the docker file
ADD launch.sh /root
ADD runvpic.sh /root
ADD vpic_config /root
ADD vpic_config2 /root

USER root

RUN mkdir /var/run/sshd