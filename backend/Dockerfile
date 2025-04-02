# use ubuntu as base
FROM ubuntu:20.04

# set env to avoid interactive installs
ENV DEBIAN_FRONTEND=noninteractive

# install dependencies
RUN apt-get update -y && apt-get install -y \
    wget \
    curl \
    unzip \
    openjdk-8-jdk \
    lib32z1 \
    lib32ncurses6 \
    lib32stdc++6 \
    libx11-dev \
    libxrandr-dev \
    xvfb \
    x11vnc \
    supervisor \
    gnupg \
    bash

# download and install genymotion
RUN wget https://dl.genymotion.com/releases/genymotion-3.8.0/genymotion-3.8.0-linux_x64.bin -O genymotion-installer.bin && \
    chmod +x genymotion-installer.bin && \
    ./genymotion-installer.bin && \
    rm genymotion-installer.bin

# install kasmvnc dependencies
RUN curl -sSL https://kasmweb.com/apt/kasmweb.gpg | tee /etc/apt/trusted.gpg.d/kasmweb.asc
RUN echo "deb https://kasmweb.com/apt/ stable main" | tee -a /etc/apt/sources.list.d/kasmweb.list
RUN apt-get update -y && apt-get install -y kasmvnc

# set default display for xvfb
ENV DISPLAY=:0

# copy scripts to start genymotion and kasmvnc
COPY run.sh /run.sh
RUN chmod +x /run.sh

# start kasmvnc and genymotion
CMD ["/run.sh"]
