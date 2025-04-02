# use ubuntu as base image
FROM ubuntu:20.04

# install dependencies
RUN apt-get update -y && \
    apt-get install -y wget curl unzip libqt5widgets5 libqt5gui5 \
    virtualbox libqt5opengl5

# install genymotion
RUN wget https://dl.genymotion.com/releases/genymotion-3.8.0/genymotion-3.8.0-linux_x64.bin && \
    chmod +x genymotion-3.8.0-linux_x64.bin && \
    ./genymotion-3.8.0-linux_x64.bin

# install vnc and other utilities
RUN apt-get install -y x11vnc xvfb

# expose vnc port
EXPOSE 6901

# start genymotion and vnc server
CMD ["/bin/bash", "-c", "genymotion & x11vnc -display :0 -nopw -forever -shared"]
