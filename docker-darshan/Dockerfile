from ompi-base

# Create directories
RUN mkdir -p /usr/projects/darshan
RUN chmod 775 /usr/projects/darshan
RUN mkdir /usr/projects/darshan/logs
RUN chmod 775 /usr/projects/darshan/logs
RUN chmod g+s /usr/projects/darshan/logs

RUN echo "Acquire::http::Proxy \"http://proxyout.lanl.gov:8080\";" >> /etc/apt/apt.conf
RUN echo "Acquire::https::Proxy \"http://proxyout.lanl.gov:8080\";" >> /etc/apt/apt.conf

ENV http_proxy=http://proxyout.lanl.gov:8080
ENV https_proxy=http://proxyout.lanl.gov:8080
RUN sudo apt-get update
RUN sudo apt-get install zlib1g-dev

RUN wget ftp://ftp.mcs.anl.gov/pub/darshan/releases/darshan-3.1.4.tar.gz
RUN tar -zxf darshan-3.1.4.tar.gz
RUN mkdir -p /usr/projects/darshan/sw/darwin
ENV CC=mpicc
RUN cd darshan-3.1.4/darshan-runtime && ./configure --prefix=/usr/projects/darshan/sw/darwin --with-mem-align=8 --with-log-path=/usr/projects/darshan/logs --with-jobid-env=NONE --enable-group-readable-logs
RUN cd darshan-3.1.4/darshan-runtime && make clean
RUN cd darshan-3.1.4/darshan-runtime && make
RUN cd darshan-3.1.4/darshan-runtime && make install

RUN cd darshan-3.1.4/darshan-util && ./configure --prefix=/usr/projects/darshan/sw/darwin
RUN cd darshan-3.1.4/darshan-util && make clean
RUN cd darshan-3.1.4/darshan-util && make
RUN cd darshan-3.1.4/darshan-util && make install

RUN /usr/projects/darshan/sw/darwin/bin/darshan-mk-log-dirs.pl
