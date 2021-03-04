FROM ubuntu:20.04

EXPOSE 2456

VOLUME /root/app

COPY startup_script.sh /root/startup_script.sh
RUN chmod +x /root/startup_script.sh

ENV SERVER_NAME=MyCoolServer
ENV WORLD=MyWorld
ENV PASSWORD=Password

WORKDIR /root/app
CMD ["/root/startup_script.sh"]