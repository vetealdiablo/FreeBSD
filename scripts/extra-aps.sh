#!/bin/bash
# Script para instalar y configurar aplicaciones extras en FreeBSD

# Instalación de paquetes necesarios
sudo pkg install -y \
    cups \                    # Sistema de impresión
    system-config-printer \    # Herramienta para configurar impresoras
    hplip \                    # Controladores para impresoras HP
    gimp \                     # Software de edición de imágenes
    audacity \                 # Editor de audio
    unzip \                    # Descompresor de archivos ZIP
    zip \                      # Herramienta para comprimir archivos ZIP
    unrar \                    # Descompresor de archivos RAR
    rar \                      # Herramienta para comprimir archivos RAR
    vim \                      # Editor de texto Vim
    py38-glances \             # Monitor del sistema (versión Python 3.8)
    screenfetch \              # Herramienta para mostrar información del sistema en la terminal
    transmission-gtk \         # Cliente de BitTorrent con interfaz gráfica
    figlet                      # Herramienta para crear texto en ASCII

# Reiniciar el servicio de cups para aplicar cambios
sudo /usr/local/etc/rc.d/cupsd restart

# Añadir usuario root y diablo al grupo cups (para gestionar impresoras)
# Cambiar 'diablo' por el nombre de usuario correspondiente
sudo pw usermod root -G cups
sudo pw usermod diablo -G cups

# Mensaje de finalización con formato colorido
echo -e "\e[91m\e[1m¡Todo hecho!\e[0m"


