#!/bin/bash
# Completar instalación
cd
sudo mv /usr/local/etc/gdm/locale.conf /usr/local/etc/gdm/locale.conf.backup
sudo cp freebsd/configs/idioma/gdm/locale.conf /usr/local/etc/gdm/
sudo cd
sudo mv /etc/login.conf /etc/login.conf.backup
sudo cp freebsd/configs/idioma/login.conf /etc/
sudo cap_mkdb /etc/login.conf
echo "cap_mkdb /etc/login.conf ===> ¡Listo!"
sudo cp freebsd/configs/sddm.conf /usr/local/etc/
#For AC powered devices (PC, etc..)
sudo gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout '0'
#For Battery powered devices (Laptops, Notebooks etc..)
sudo gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout '0
# Cambiar el nombre de usuario por el actual.
sudo chsh -s /usr/local/bin/zsh diablo
sudo reboot
echo -e "\e[91m\e[1m¡Todo hecho! Reiniciamos \e[0m"
