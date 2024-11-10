#!/bin/sh

# Verificar si el script se está ejecutando con privilegios de superusuario
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script necesita privilegios de superusuario."
  exit 1
fi

# Definir la nueva shell
NUEVA_SHELL="/usr/local/bin/bash"

# Verificar si bash está instalado
if [ ! -x "$NUEVA_SHELL" ]; then
  echo "No se encontró bash en $NUEVA_SHELL. Instalalo primero con: sudo pkg install bash"
  exit 1
fi

# Solicitar el nombre de usuario
read -p "Introduce el nombre de usuario para cambiar la shell: " USUARIO

# Comprobar si el usuario existe
if ! id "$USUARIO" &>/dev/null; then
  echo "El usuario $USUARIO no existe."
  exit 1
fi

# Cambiar la shell del usuario
usermod -s "$NUEVA_SHELL" "$USUARIO"

echo "La shell de $USUARIO ha sido cambiada a $NUEVA_SHELL."
