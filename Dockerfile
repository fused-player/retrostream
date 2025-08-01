FROM ubuntu:latest

WORKDIR /usr/local/app

RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    git

RUN add-apt-repository ppa:libretro/stable && apt-get update && apt-get install -y retroarch

RUN apt-get install -y novnc  openbox python3-websockify && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/novnc/noVNC.git

RUN apt-get purge -y software-properties-common && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt update && apt install -y \
    dbus dbus-x11 dbus-user-session \
    gamemode libgamemode0 libgamemodeauto0

RUN apt-get update && apt-get install -y tigervnc-standalone-server

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.vnc && \
    echo "retrostream" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

RUN mkdir roms

COPY ./start.sh .

CMD ["bash", "start.sh"]
