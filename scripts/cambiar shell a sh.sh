#!/bin/bash

# Script para cambiar la shell de un usuario en FreeBSD
# Opciones:
#   - Cambiar a bash
#   - Volver a la shell por defecto de FreeBSD (sh)

# Verificar si el script se está ejecutando con privilegios de superusuario
if [ "$(id -u)" -ne 0 ]; then
  echo "Este script necesita privilegios de superusuario."
  exit 1
fi

# Función para cambiar la shell
cambiar_shell() {
  local usuario=$1
  local shell=$2

  # Verificar si el usuario existe
  if ! id "$usuario" &>/dev/null; then
    echo "El usuario $usuario no existe."
    exit 1
  fi

  # Verificar si la nueva shell existe
  if [ ! -x "$shell" ]; then
    echo "La shell $shell no se encuentra o no está ejecutable."
    exit 1
  fi

  # Cambiar la shell
  usermod -s "$shell" "$usuario"
  echo "La shell de $usuario ha sido cambiada a $shell."
}

# Función para revertir a la shell por defecto de FreeBSD
revertir_shell() {
  local usuario=$1
  local shell_defecto="/bin/sh"

  # Cambiar la shell al valor por defecto de FreeBSD
  usermod -s "$shell_defecto" "$usuario"
  echo "La shell de $usuario ha sido revertida a la shell por defecto: $shell_defecto."
}

# Mostrar opciones al usuario
echo "Elija una opción:"
echo "1) Cambiar la shell a bash"
echo "2) Volver a la shell por defecto de FreeBSD (sh)"
echo "3) Salir"

# Leer opción seleccionada
read -p "Introduce el número de la opción (1, 2, 3): " opcion

# Solicitar el nombre de usuario
read -p "Introduce el nombre de usuario para cambiar la shell: " USUARIO

case $opcion in
  1)
    # Cambiar a bash
    NUEVA_SHELL="/usr/local/bin/bash"
    cambiar_shell "$USUARIO" "$NUEVA_SHELL"
    ;;
  2)
    # Volver a la shell por defecto de FreeBSD
    revertir_shell "$USUARIO"
    ;;
  3)
    # Salir
    echo "Saliendo del script."
    exit 0
    ;;
  *)
    # Opción no válida
    echo "Opción no válida."
    exit 1
    ;;
esac
