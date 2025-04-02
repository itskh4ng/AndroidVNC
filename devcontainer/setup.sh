#!/bin/bash

# upd
sudo apt update && sudo apt install -y docker.io nodejs npm

# start dock
sudo systemctl enable --now docker

# kasm
docker pull kasmvnc/android-emulator

# background emu
docker run -d --name android_emulator -p 6901:6901 kasmvnc/android-emulator

# setup backend
mkdir backend && cd backend
npm init -y
npm install express cors

# server.js
cat <<EOF > server.js
const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors());
app.get('/status', (req, res) => res.json({ message: 'Emulator Running' }));
app.listen(3000, () => console.log('Server running on port 3000'));
EOF

node server.js &
