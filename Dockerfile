# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-selkies:alpine322

# set version label
ARG BUILD_DATE
ARG VERSION
ARG LOLLYPOP_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# title
ENV TITLE=Lollypop

RUN \
  echo "**** add icon ****" && \
  curl -o \
    /usr/share/selkies/www/icon.png \
    https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/lollypop-icon.png && \
  echo "**** install packages ****" && \
  apk add --no-cache \
    adwaita-icon-theme \
    lollypop \
    py3-beautifulsoup4 \
    youtube-dl && \
  ln -s \
    /usr/lib/libpython3.10.so.1.0 \
    /usr/lib/libpython3.10.so && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3001

VOLUME /config
