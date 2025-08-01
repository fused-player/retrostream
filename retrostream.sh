#!/bin/bash

mkdir $HOME/retrostream

docker $1 \
  --name retrostream \
  --device /dev/dri \
  --device /dev/snd \
  -v /usr/lib/x86_64-linux-gnu/dri:/usr/lib/x86_64-linux-gnu/dri \
  -v /run/user/1000/pulse:/run/user/1000/pulse \
  -v $HOME/retrostream:/usr/local/app/roms \
  -e DISPLAY=:1 \
  -e RETROARCH_NO_GAME_MODE=1 \
  -e PULSE_SERVER=unix:/run/user/1000/pulse/native \
  -p 5900:5900 -p 6080:6080 \
  --env-file .env \
  fusedplayer49/retrostream


