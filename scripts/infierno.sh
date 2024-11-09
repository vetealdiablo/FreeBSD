#!/bin/sh

# ==========================================
# Sección 1: Instalación de Apps y Dependencias
# ==========================================

# Actualizar los repositorios de paquetes
pkg update -y || { echo "Error al actualizar los repositorios"; exit 1; }

# Instalar paquetes necesarios
pkg install -y nano git bash sudo htop vim ninja cmake curl wget bash-completion zsh zsh-completions \
zsh-syntax-highlighting zsh-autosuggestions fusefs-ntfs fusefs-ext2 xorg xrandr xkill xinit xsetroot \
nvidia-driver-470 nvidia-settings nvidia-xconfig font-awesome bspwm sxhkd polybar \
rofi lxappearance feh picom rxvt-unicode zathura zathura-pdf-poppler || { echo "Error al instalar los paquetes"; exit 1; }

# Configurar el driver de NVIDIA
nvidia-xconfig

# Mensaje de éxito en rojo claro
echo "\033[1;31mInstalación completada y configuración de NVIDIA aplicada.\033[0m"


# ==========================================
# Sección 2: Comandos de Configuración del Sistema
# ==========================================

# Cargar el módulo FUSE para sistemas de archivos
kldload fusefs || { echo "Error al cargar el módulo FUSE"; exit 1; }

# Configuración del sudoers para el usuario 'diablo' y el grupo 'wheel'
echo 'diablo ALL=(ALL) ALL' >> /usr/local/etc/sudoers
echo '%wheel ALL=(ALL) ALL' >> /usr/local/etc/sudoers

# Habilitar servicios al arranque (módulos y servicios)
echo 'kld_list="nvidia-modeset fuse"' >> /etc/rc.conf
echo 'sddm_enable="NO"' >> /etc/rc.conf

# ==========================================
# Sección 3: Configuración de loader.conf
# ==========================================

# Agregar configuraciones al archivo /boot/loader.conf
echo '#kern.vty=sc' >> /boot/loader.conf
echo 'hw.vga.textmode=1' >> /boot/loader.conf

# ==========================================
# Sección 4: Configuración de idioma
# ==========================================

# Asegurarse de que el directorio existe
mkdir -p /usr/local/etc/X11/xorg.conf.d/

# Eliminar el archivo si ya existe para evitar duplicados
rm -f /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf

# Crear el archivo con el nuevo contenido
cat << EOF > /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbLayout" "es,us"
    Option "XkbVariant" "nodeadkeys"
    Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
EOF

# Confirmación de creación en rojo claro
echo "\033[1;31mArchivo de configuración creado correctamente: /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf\033[0m"


# ==========================================
# Mensaje Final
# ==========================================
echo "\033[1;31mInstalación completa. ¡Reinicia el sistema para aplicar los cambios!\033[0m"
