#!/bin/bash
# Aps extras

sudo pkg install -y cups system-config-printer hplip gimp audacity unzip zip unrar rar vim py38-glances screenfetch transmission-gtk figlet
sudo /usr/local/etc/rc.d/cupsd restart
#Cambiar el nombre de usuario por el que esté usando actualmente.
sudo pw usermod root -G cups
sudo pw usermod diablo -G cups
echo -e "\e[91m\e[1m¡Todo hecho!\e[0m"

