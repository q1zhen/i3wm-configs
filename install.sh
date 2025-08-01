#!/bin/bash

mkdir -p ~/tmp
cd ~/tmp

sudo apt update
sudo apt install i3 i3status dmenu feh i3blocks python3-i3ipc python3-requests playerctl

# i3lock-color
sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev libgif-dev
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh
cd ..

# snixembed
# https://gist.github.com/archisman-panigrahi/cd571ddea1aa2c5e2b4fa7bcbee7d5df
sudo apt install build-essential valac git libdbusmenu-gtk3-dev -y
git clone https://git.sr.ht/~steef/snixembed
cd snixembed
make
sudo make install
desktop_entry="[Desktop Entry]
Type=Application
Name=snixembed
Exec=snixembed --fork"
mkdir -p /etc/xdg/autostart
echo "$desktop_entry" > /etc/xdg/autostart/snixembed.desktop

cd ~
rm -rf ~/tmp


