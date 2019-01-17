FROM ubuntu:18.04

# Updates apt-get lists
RUN echo "Installing packages..." && \
    dpkg --add-architecture i386 && \
    sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y wget curl python python-apt xterm xz-utils zenity libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386 

# Downloads and installs Steam .deb
RUN echo "Installing Steam..." && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb -O /tmp/steam.deb -q && \
    dpkg -i /tmp/steam.deb && \
    rm -rf /tmp/*

# Creates a new user
RUN echo "Creating User..." && \
    useradd -ms /bin/bash steam

USER steam
ENV HOME /home/steam
WORKDIR /home/steam
CMD /usr/bin/steam
