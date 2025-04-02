#!/bin/bash

# upd and install
sudo apt-get update
sudo apt-get install -y docker.io python3

# node.js etc lib
cd /workspaces/AndroidVNC/backend
npm install

# pull and run the docker img
docker pull budtmo/docker-android
docker run -d --name android_emulator -p 6901:6901 budtmo/docker-android

# start py3 for uh frontend
nohup python3 -m http.server 8080 &
