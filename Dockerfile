FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine319

# set version label
ARG BUILD_DATE
ARG VERSION
ARG FILEZILLA_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# title
ENV TITLE=Lollypop

RUN \
  echo "**** install packages ****" && \
  apk add --no-cache \
    adwaita-icon-theme \
    lollypop \
    youtube-dl && \
  ln -s \
    /usr/lib/libpython3.10.so.1.0 \
    /usr/lib/libpython3.10.so && \
  echo "**** OpenBox tweaks ****" && \
  sed -i 's|</applications>|  <application title="Lollypop" type="normal">\n    <maximized>yes</maximized>\n  </application>\n</applications>|' /etc/xdg/openbox/rc.xml && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config
