FROM ubuntu:latest

RUN apt-get -y update
RUN apt-get -y install build-essential flex bison

COPY . /unicornscan
WORKDIR /unicornscan

RUN patch src/unilib/tsc.c patches/unicornscan-0.4.7-gcc5.patch
RUN ./configure CFLAGS=-D_GNU_SOURCE --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-bundled-ltdl
RUN make
RUN make install
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/unicornscan/entrypoint.sh"]
CMD []
