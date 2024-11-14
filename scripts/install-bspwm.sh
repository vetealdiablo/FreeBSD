#!/bin/sh

# ==========================================
# Sección 1: Instalación de Apps y Dependencias
# ==========================================

# Actualizar repositorios y paquetes
pkg update -y && pkg upgrade -y || { echo "Error al actualizar los paquetes"; exit 1; }

# Instalar paquetes necesarios
pkg install -y patch pkgconf nano doas git bash sudo htop vim ninja cmake curl wget bash-completion zsh zsh-completions \
zsh-syntax-highlighting zsh-autosuggestions fusefs-ntfs fusefs-ext2 xorg xrandr xkill xinit xsetroot \
nvidia-driver-470 nvidia-settings nvidia-xconfig font-awesome bspwm xbindkeys numlockx sxhkd polybar \
rofi lxappearance feh picom rxvt-unicode py311-ueberzug py311-ranger zathura unzip zathura-pdf-poppler || { echo "Error al instalar los paquetes"; exit 1; }

# Configurar el driver de NVIDIA
nvidia-xconfig

# Mensaje de éxito en rojo claro
echo "Instalación completada y configuración de NVIDIA aplicada."


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
echo 'linux_enable="YES"' >> /etc/rc.conf

# Configuración adicional en rc.conf
echo 'dbus_enable="YES"' >> /etc/rc.conf
echo 'hald_enable="YES"' >> /etc/rc.conf
echo 'powerd_enable="YES"' >> /etc/rc.conf # Para optimización de energía
echo 'background_dhclient="YES"' >> /etc/rc.conf # Para conexiones de red

# ==========================================
# Sección 3: Configuración de loader.conf
# ==========================================

# Agregar configuraciones al archivo /boot/loader.conf
# Sirve para que nvidia no rompa las TTYs
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
echo "Archivo de configuración creado correctamente: /usr/local/etc/X11/xorg.conf.d/00-keyboard.conf"

# Copia login.conf
cp /etc/login.conf /etc/login.conf.backup
cp FreeBSD/locales/login.conf /etc/

# Reconstrucción de la base de datos de capacidades
cap_mkdb /etc/login.conf

# ==========================================
# Mensaje Final
# ==========================================
echo "Instalación completa. ¡Reinicia el sistema para aplicar los cambios!"
