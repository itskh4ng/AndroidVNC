#!/bin/bash

# start genymotion virtual device
./genymotion genymotion-shell --list
./genymotion genymotion-shell --start "YourVirtualDeviceName"

# start vnc server
x11vnc -display :0 -nopw -forever
