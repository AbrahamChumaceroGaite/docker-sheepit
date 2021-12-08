FROM openjdk:11-jre-slim

# File Author / Maintainer
MAINTAINER zocker-160

ENV DEBIAN_FRONTEND noninteractive


RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends curl \
    # Blender dependencies
    libsdl1.2debian \
    libxxf86vm1 \
    libgl1-mesa-glx \
    libglu1-mesa \
    libxi6 \
    libxrender1 \
    libxfixes3 \
    libglu1-mesa

RUN \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    apt-get purge -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /sheep
COPY startapp.sh /startapp.sh
RUN mkdir -p /sheep/cache

ENV user_name "zocker_160"
ENV user_password "2Y6jA1SDCaOeu7lPq6xMLqG2faqaBhR4I4CfxyAz"
ENV cpu "0"
ENV gpu ""
ENV ui "text"

ENTRYPOINT ["/startapp.sh"]
