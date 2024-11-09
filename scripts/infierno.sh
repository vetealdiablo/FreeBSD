#!/bin/bash

# ==========================================
# Sección 1: Instalación de Apps y Dependencias
# ==========================================

# Actualizar los repositorios de paquetes
pkg update -y

pkg install -y nano git bash sudo htop vim ninja cmake curl wget bash-completion zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions fusefs-ntfs fusefs-ext2 xorg xrandr xkill xinit xsetroot nvidia-driver-470 nvidia-settings nvidia-xconfig font-awesome sourcecodepro-ttf bspwm sxhkd polybar rofi lxappearance py-ranger py-ueberzug feh picom rxvt-unicode zathura zathura-pdf-poppler


# Configurar el driver de NVIDIA
nvidia-xconfig

# Mensaje de éxito en rojo claro
echo -e "\033[1;31mInstalación completada y configuración de NVIDIA aplicada.\033[0m"


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
echo 'sddm_enable="NO"' | sudo tee -a /etc/rc.conf > /dev/null

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

# Asegurarse de que el directorio existe
sudo mkdir -p /usr/local/etc/X11/xorg.conf.d/

# Eliminar el archivo si ya existe para evitar duplicados
sudo rm -f /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf

# Crear el archivo con el nuevo contenido
echo 'Section "InputClass"' | sudo tee /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo '    Identifier "system-keyboard"' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo '    MatchIsKeyboard "on"' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo '    Option "XkbLayout" "es,us"' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo '    Option "XkbVariant" "nodeadkeys"' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo '    Option "XkbOptions" "grp:alt_shift_toggle"' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
echo 'EndSection' | sudo tee -a /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null

# Confirmación de creación en rojo claro
echo -e "\033[1;31mArchivo de configuración creado correctamente: /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf\033[0m"


# ==========================================
# Mensaje Final
# ==========================================
echo -e "\033[1;31mInstalación completa. ¡Reinicia el sistema para aplicar los cambios!\033[0m"
