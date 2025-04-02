#!/bin/bash

# Update and install dependencies
sudo apt update && sudo apt install -y docker.io nodejs npm

# Start Docker service
sudo systemctl enable --now docker

# emulated vnc
docker pull kasmvnc/android-emulator

# run in background
docker run -d --name android_emulator -p 6901:6901 kasmvnc/android-emulator

# backend
mkdir -p /workspaces/AndroidVNC/backend
cd /workspaces/AndroidVNC/backend

# run backend
npm init -y
npm install express cors

# create server.js
cat <<EOF > server.js
const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors());
app.get('/status', (req, res) => res.json({ message: 'Emulator Running' }));
app.listen(3000, () => console.log('Server running on port 3000'));
EOF

node server.js &

cd /workspaces/AndroidVNC
nohup python3 -m http.server 8080 &
