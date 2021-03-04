FROM cm2network/steamcmd:steam

EXPOSE 2456

VOLUME /steam/app
VOLUME /steam/world_data

# RUN apt-get update && apt-get -y install libsdl2-2.0-0:i386

# RUN apt-get update && apt-get -y install software-properties-common

# RUN add-apt-repository multiverse &&\
#     dpkg --add-architecture i386 &&\
#     apt-get update &&\
#     apt-get purge steam steamcmd &&\
#     env ACCEPT_EULA=Y apt-get -y install lib32gcc-s1 steamcmd 
USER root

COPY startup_script.sh /steam/startup_script.sh
RUN chown steam /steam/startup_script.sh
RUN chmod +x /steam/startup_script.sh


USER steam

ENV SERVER_NAME=MyCoolServer
ENV WORLD_NAME=MyWorld
ENV PASSWORD=Password

WORKDIR /steam/app
ENTRYPOINT ["/steam/startup_script.sh"]