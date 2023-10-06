FROM jlesage/baseimage-gui:ubuntu-22.04-v4 AS build

MAINTAINER Bjoern Gruening, bjoern.gruening@gmail.com

RUN apt-get update -y && \
     apt-get dist-upgrade -y && \
     DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
         bzip2 \
         ca-certificates \
         libgl1 \
        # openjfx \
         qt5dxcb-plugin \
         wget && \
     rm -rf /var/lib/apt/lists/*

ARG VERSION=1.4.0

RUN mkdir -p /opt/ilastik &&\
    chmod 777 /opt/ilastik &&\
    cd /opt/ilastik/ && \
    wget -q https://files.ilastik.org/ilastik-$VERSION-Linux.tar.bz2 &&\
    tar -xjf ilastik-$VERSION-Linux.tar.bz2 && \
    rm ilastik-$VERSION-Linux.tar.bz2 && \
    chmod u+x ilastik-$VERSION-Linux/run_ilastik.sh && \
    ln -s /opt/ilastik/ilastik-$VERSION-Linux/run_ilastik.sh /bin/ilastik

# Generate and install favicons.
#RUN APP_ICON_URL=https://www.ilastik.org/assets/ilastik-logo.png && \
#    install_app_icon.sh "$APP_ICON_URL"

EXPOSE 5800

#COPY startapp.sh /startapp.sh
#RUN chmod +x /startapp.sh

# Set the name of the application.
ENV APP_NAME="Ilastik"

ENV KEEP_APP_RUNNING=0

ENV TAKE_CONFIG_OWNERSHIP=1

WORKDIR /config
