# use ubuntu as base image
FROM ubuntu:20.04

# install dependencies
RUN apt-get update -y && \
    apt-get install -y wget curl unzip libqt5widgets5 libqt5gui5 \
    virtualbox libqt5opengl5 x11vnc xvfb

# install genymotion
RUN wget https://dl.genymotion.com/releases/genymotion-3.8.0/genymotion-3.8.0-linux_x64.bin && \
    chmod +x genymotion-3.8.0-linux_x64.bin && \
    ./genymotion-3.8.0-linux_x64.bin

# install nodejs and npm for the server
RUN apt-get install -y nodejs npm

# expose vnc and server ports
EXPOSE 6901
EXPOSE 3000

# copy server files to container
COPY ./backend /app

# set working directory
WORKDIR /app

# install server dependencies
RUN npm install

# make setup script executable
RUN chmod +x /app/setup.sh

# run server and genymotion
CMD ["bash", "-c", "nohup ./setup.sh & node server.js & tail -f /dev/null"]
