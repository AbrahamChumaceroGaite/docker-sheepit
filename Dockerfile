FROM eclipse-temurin:11-jre

MAINTAINER zocker-160

ENV DEBIAN_FRONTEND noninteractive
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES all

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends curl \
    libxi6 \
    libxrender1 \
    libglu1-mesa \
    libgl1 \
    libgl1-mesa-dri \
    libglx-mesa0 \
    libxxf86vm1 \
    libxkbcommon0 \
    libsm6 \
    xz-utils \
    ncat \
    screen \
    unzip \
    7zip \
    curl \
    micro \
    vim

RUN \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    apt-get purge -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /sheep

COPY startapp.sh /startapp.sh
RUN chmod +x /startapp.sh

RUN mkdir -p /sheep/cache

# Variables de entorno para el cliente SheepIt
ENV user_name "<username>"
ENV user_password "<password_or_public_key>"
ENV cpu "0"
ENV gpu "OPTIX_0"
ENV ui "text"

ENTRYPOINT ["/startapp.sh"]
