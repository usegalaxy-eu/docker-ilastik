FROM jlesage/baseimage-gui:ubuntu-22.04-v4 AS build

MAINTAINER Bjoern Gruening, bjoern.gruening@gmail.com

RUN apt-get update -y && \
     DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
         ca-certificates \
         wget \
         libgl1 \
         xz-utils \
         openjfx \
         qt5dxcb-plugin && \
     rm -rf /var/lib/apt/lists/*


COPY startapp.sh /startapp.sh
RUN chmod +x /startapp.sh && \
    mkdir -p /app/odv

# --image foo.tiff

RUN mkdir -p /opt/qupath &&\
    chmod 777 /opt/qupath
ADD https://github.com/qupath/qupath/releases/download/v0.4.3/QuPath-0.4.3-Linux.tar.xz /opt/qupath/
RUN cd /opt/qupath && tar -xvf QuPath-0.4.3-Linux.tar.xz && \
    rm /opt/qupath/QuPath-0.4.3-Linux.tar.xz && \
    chmod u+x /opt/qupath/QuPath/bin/QuPath

# Generate and install favicons.
RUN APP_ICON_URL=https://github.com/qupath/qupath/wiki/images/qupath_128.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Set the name of the application.
ENV APP_NAME="QuPath"

ENV KEEP_APP_RUNNING=0

ENV TAKE_CONFIG_OWNERSHIP=1

WORKDIR /config
