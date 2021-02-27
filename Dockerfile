FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y lib32z1 xinetd psmisc && \
    apt-get install -y qemu-system && \
    useradd -u 8888 -m pwn

COPY ./share /home/pwn
COPY ./xinetd /etc/xinetd.d/xinetd

WORKDIR /home/pwn

EXPOSE 8888

CMD ["/usr/sbin/xinetd", "-dontfork"]
