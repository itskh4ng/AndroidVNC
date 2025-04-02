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
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# download genymotion installer quietly
RUN wget --quiet https://dl.genymotion.com/releases/genymotion-3.8.0/genymotion-3.8.0-linux_x64.bin -O /tmp/genymotion-installer.bin

# install genymotion
RUN chmod +x /tmp/genymotion-installer.bin && \
    /tmp/genymotion-installer.bin -y -a /opt/genymobile/genymotion && \
    rm /tmp/genymotion-installer.bin

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
