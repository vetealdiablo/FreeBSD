#!/bin/bash

# ==========================================
# Sección 1: Instalación de Apps y Dependencias
# ==========================================

# Actualizar los repositorios de paquetes
pkg update

# Instalar herramientas básicas y utilidades
pkg install -y nano git bash sudo vim ninja cmake curl wget bash-completion zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions fusefs-ntfs fusefs-ext2

# Paquetes para entorno gráfico y utilidades
pkg install -y xorg xrandr xkill xinit xsetroot nvidia-driver-470 nvidia-settings nvidia-xconfig font-awesome sourcecodepro-ttf

# Instalar entorno minimalista con BSPWM, Polybar, Rofi, etc.
pkg install -y bspwm sxhkd polybar rofi lxappearance pcmanfm py39-ranger py39-ueberzug feh picom rxvt-unicode zathura zathura-pdf-poppler

# Paquetes de audio (PulseAudio) (Descomentado si es necesario)
# pkg install -y pulseaudio pulseaudio-alsa pavucontrol alsa-utils

# Configurar el driver de NVIDIA
nvidia-xconfig

# ==========================================
# Sección 2: Comandos de Configuración del Sistema
# ==========================================

# Cargar el módulo FUSE para sistemas de archivos
kldload fusefs

# Configuración del sudoers para el usuario 'diablo' y el grupo 'wheel'
echo 'diablo ALL=(ALL) ALL' | sudo tee -a /usr/local/etc/sudoers > /dev/null
echo '%wheel ALL=(ALL) ALL' | sudo tee -a /usr/local/etc/sudoers > /dev/null

# Si necesitas montar /proc al iniciar el sistema, descomentar la siguiente línea
# echo 'proc /proc procfs rw 0 0' | sudo tee -a /etc/fstab > /dev/null

# Habilitar servicios al arranque (módulos y servicios)
echo 'kld_list="nvidia-modeset"' | sudo tee -a /etc/rc.conf > /dev/null
echo 'sddm_enable="YES"' | sudo tee -a /etc/rc.conf > /dev/null

# ==========================================
# Sección 3: Configuración de loader.conf
# ==========================================

# Agregar configuraciones al archivo /boot/loader.conf
# Descomentado para establecer el modo texto en consola
echo '#kern.vty=sc' | sudo tee -a /boot/loader.conf > /dev/null
echo 'hw.vga.textmode=1' | sudo tee -a /boot/loader.conf > /dev/null

# ==========================================
# Sección 4: Configuración de idioma
# ==========================================

# Eliminar el archivo si ya existe para evitar duplicados
sudo rm -f /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf

# Crear el archivo con el nuevo contenido
echo 'Section "InputClass"' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo '    Identifier "system-keyboard"' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo '    MatchIsKeyboard "on"' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo '    Option "XkbLayout" "es,us"' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo '    Option "XkbVariant" "nodeadkeys"' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo '    Option "XkbOptions" "grp:alt_shift_toggle"' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo 'EndSection' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null


# ==========================================
# Mensaje Final
# ==========================================
echo "Instalación completa. ¡Reinicia el sistema para aplicar los cambios!"
