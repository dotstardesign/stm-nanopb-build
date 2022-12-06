FROM ubuntu:20.04

RUN apt-get update && \
	apt-get install -y build-essential g++ gcc srecord protobuf-compiler wget python3 python3-protobuf gcc-arm-none-eabi && \
	rm -rf /var/lib/apt/lists/*

RUN cd /opt && mkdir nanopb && cd nanopb && \
    wget https://jpa.kapsi.fi/nanopb/download/nanopb-0.4.6-linux-x86.tar.gz && \
    tar xzf nanopb-0.4.6-linux-x86.tar.gz && \
    rm nanopb-0.4.6-linux-x86.tar.gz

RUN mkdir /build

WORKDIR /build
VOLUME /build

CMD make