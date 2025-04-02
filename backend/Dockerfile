# start with a minimal ubuntu image
FROM ubuntu:20.04

# install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    openjdk-8-jdk \
    lib32z1 \
    libx11-dev \
    xvfb \
    x11vnc \
    supervisor

# download and install genymotion
RUN wget https://dl.genymotion.com/releases/genymotion-3.8.0/genymotion-3.8.0-linux_x64.bin -O genymotion-installer.bin && \
    chmod +x genymotion-installer.bin && \
    ./genymotion-installer.bin && \
    rm genymotion-installer.bin

# install kasmvnc
RUN curl -sSL https://kasmweb.com/apt/kasmweb.gpg | tee /etc/apt/trusted.gpg.d/kasmweb.asc
RUN echo "deb https://kasmweb.com/apt/ stable main" | tee -a /etc/apt/sources.list.d/kasmweb.list
RUN apt-get update && apt-get install -y kasmvnc

# copy the run script to start the services
COPY run.sh /run.sh
RUN chmod +x /run.sh

# set default display
ENV DISPLAY=:0

# start services
CMD ["/run.sh"]
