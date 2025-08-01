#!/bin/bash

export DISPLAY=:1
export RETROARCH_NO_GAME_MODE=1
export XDG_RUNTIME_DIR="/tmp/runtime"
mkdir -p "$XDG_RUNTIME_DIR"

eval "$(dbus-launch --sh-syntax)"

vncserver :1 -geometry ${RS_WIDTH}x${RS_HEIGHT} -depth 24

sleep 2

openbox &

retroarch -f &

cd noVNC
./utils/novnc_proxy --vnc localhost:5901 --listen 6080
