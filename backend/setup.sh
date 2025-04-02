#!/bin/bash

# start genymotion emulator with device name "localdroid"
cd /workspaces/AndroidVNC/genymotion
./genymotion genymotion-shell --start "localdroid" &

# start x11vnc for VNC server
x11vnc -display :0 -nopw -forever &

# start noVNC to make the VNC accessible through browser
websockify -D --web /usr/share/novnc 6901 localhost:5900 &

# start backend server
cd /workspaces/AndroidVNC/backend
node server.js &
