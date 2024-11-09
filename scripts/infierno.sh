#!/bin/bash

# Actualizar los repositorios de paquetes
pkg update

# Instalar herramientas básicas y utilidades
pkg install -y nano bash sudo vim ninja cmake curl wget bash-completion zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions fusefs-ntfs fusefs-ext2

# Cargar el módulo FUSE para sistemas de archivos
kldload fusefs

# Configuración del sudoers para el usuario 'diablo' y el grupo 'wheel'
echo 'diablo ALL=(ALL) ALL' | sudo tee -a /usr/local/etc/sudoers > /dev/null
echo '%wheel ALL=(ALL) ALL' | sudo tee -a /usr/local/etc/sudoers > /dev/null

# Montar /proc al iniciar el sistema
echo 'proc /proc procfs rw 0 0' | sudo tee -a /etc/fstab > /dev/null

# Configuración del arranque y módulos
echo 'nvidia-modeset_load="YES"' | sudo tee -a /boot/loader.conf > /dev/null
echo '#kern.vty=sc' | sudo tee -a /boot/loader.conf > /dev/null
echo 'hw.vga.textmode=1' | sudo tee -a /boot/loader.conf > /dev/null

# Habilitar servicios al arranque
echo 'dbus_enable="YES"' | sudo tee -a /etc/rc.conf > /dev/null
echo 'gdm_enable="NO"' | sudo tee -a /etc/rc.conf > /dev/null
# Para usar SDDM en lugar de GDM, descomenta la siguiente línea
# echo 'sddm_enable="YES"' | sudo tee -a /etc/rc.conf > /dev/null
echo 'gnome_enable="NO"' | sudo tee -a /etc/rc.conf > /dev/null
echo 'kld_list="fusefs"' | sudo tee -a /etc/rc.conf > /dev/null
echo 'cupsd_enable="YES"' | sudo tee -a /etc/rc.conf > /dev/null

# Paquetes para entorno gráfico y utilidades
pkg install -y xorg xrandr xkill xinit xsetroot nvidia-driver nvidia-settings nvidia-xconfig dbus font-awesome sourcecodepro-ttf

# Instalar entorno minimalista con BSPWM, Polybar, Rofi, etc.
pkg install -y bspwm sxhkd polybar rofi lxappearance pcmanfm py39-ranger py39-ueberzug feh picom rxvt-unicode zathura zathura-pdf-poppler

# Paquetes de audio (PulseAudio)
pkg install -y pulseaudio pulseaudio-alsa pavucontrol alsa-utils

# Configuración de NVIDIA Xorg
nvidia-xconfig

# Finalizar instalación
echo "Instalación completa. ¡Reinicia el sistema para aplicar los cambios!"
