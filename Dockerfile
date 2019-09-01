FROM archlinux/base:latest

RUN pacman -Sy --noconfirm
RUN pacman -S --noconfirm patch gcc make bison flex grep

COPY . /opt/unicornscan
WORKDIR /opt/unicornscan

RUN patch src/unilib/tsc.c patches/unicornscan-0.4.7-gcc5.patch
RUN ./configure CFLAGS=-D_GNU_SOURCE && make && make install

ENTRYPOINT ["unicornscan"]
CMD []
