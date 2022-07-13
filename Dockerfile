FROM ubuntu:20.04

COPY ./* /home/

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse \n \
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse \n \
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse \n \
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse \n \
deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse \n \
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse \n \
deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse \n  \
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse \n \
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse \n \
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse">/etc/apt/sources.list

RUN cat /etc/apt/sources.list
RUN apt update 
RUN apt-get install -y wget \
    gcc \
    gcc-multilib \
    git \
    make \
    bc \
    texinfo \
    gdb \
    cgdb \
    qemu-system-x86-64 \
    libncurses5-dev \
    vim \
    cpio

WORKDIR /home
RUN chmod +x ./linux.sh
RUN bash -c "./linux.sh"

RUN cd ..
RUN chmod +x ./busybox.sh
RUN bash -c "./busybox.sh"

RUN cd ..
RUN chmod +x ./initramfs.sh
RUN chmod +x ./run.sh
RUN chmod +x ./debug.sh
RUN bash -c "./initramfs.sh"
