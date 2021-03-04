FROM ubuntu:20.04

EXPOSE 2456

VOLUME /root/app
VOLUME /world_data

RUN apt-get update && apt-get -y install software-properties-common

RUN add-apt-repository multiverse &&\
    dpkg --add-architecture i386 &&\
    apt-get update &&\
    apt-get -y install lib32gcc-s1 steamcmd 

COPY startup_script.sh /root/startup_script.sh
RUN chmod +x /root/startup_script.sh

ENV SERVER_NAME=MyCoolServer
ENV WORLD_NAME=MyWorld
ENV PASSWORD=Password

WORKDIR /root/app
CMD ["/root/startup_script.sh"]