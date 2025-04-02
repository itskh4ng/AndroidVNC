#!/bin/bash

# start xvfb for genymotion
Xvfb :0 -screen 0 1280x720x24 &

# start genymotion
/genymotion/genymotion &

# start kasmvnc
kasmvnc -p 6901
