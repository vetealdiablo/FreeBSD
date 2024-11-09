#!/bin/bash

# Actualizar los repositorios de paquetes
pkg update

# Instalar herramientas básicas y utilidades
pkg install -y nano git bash sudo vim ninja cmake curl wget bash-completion zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions fusefs-ntfs fusefs-ext2

# Cargar el módulo FUSE para sistemas de archivos
sudo kldload fusefs

# Configuración del sudoers para el usuario 'diablo' y el grupo 'wheel'
echo 'diablo ALL=(ALL) ALL' | sudo tee -a /usr/local/etc/sudoers > /dev/null
echo '%wheel ALL=(ALL) ALL' | sudo tee -a /usr/local/etc/sudoers > /dev/null

# Montar /proc al iniciar el sistema
echo 'proc /proc procfs rw 0 0' | sudo tee -a /etc/fstab > /dev/null

# Configuración del arranque y módulos


# Habilitar servicios al arranque
echo 'kld_list="nvidia-modeset"' | sudo tee -a /etc/rc.conf > /dev/null
echo 'kld_list="fusefs"' | sudo tee -a /etc/rc.conf > /dev/null


# Paquetes para entorno gráfico y utilidades
pkg install -y xorg xrandr xkill xinit xsetroot nvidia-driver nvidia-settings nvidia-xconfig dbus font-awesome sourcecodepro-ttf

# Instalar entorno minimalista con BSPWM, Polybar, Rofi, etc.
pkg install -y bspwm sxhkd polybar rofi lxappearance pcmanfm py39-ranger py39-ueberzug feh picom rxvt-unicode zathura zathura-pdf-poppler

# Paquetes de audio (PulseAudio)
pkg install -y pulseaudio pulseaudio-alsa pavucontrol alsa-utils

# Configuración de NVIDIA Xorg
# nvidia-xconfig

# Finalizar instalación
echo "Instalación completa. ¡Reinicia el sistema para aplicar los cambios!"
