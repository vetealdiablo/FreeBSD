# $FreeBSD$
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# Estas son normalmente configuradas a través de /etc/login.conf. 
# Puedes sobreescribirlas aquí si lo deseas.
# PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin; export PATH

# Configuración de idioma
LANG=es_AR.UTF-8; export LANG
LC_CTYPE=es_AR.UTF-8; export LC_CTYPE
MM_CHARSET=UTF-8; export MM_CHARSET

# Configuración para aplicaciones GTK
export GTK_LANGUAGE=es_AR.UTF-8

# Configuración para Qt
export LANG=es_AR.UTF-8
export LC_ALL=es_AR.UTF-8

# Establecer el editor y paginador
EDITOR=vi; export EDITOR
PAGER=less; export PAGER

# Definir el archivo ENV que se invoca cada vez que sh se inicia
ENV=$HOME/.shrc; export ENV

# Si no estás en tu directorio home, cambia al mismo
if [ "$PWD" != "$HOME" ] && [ "$PWD" -ef "$HOME" ] ; then cd ; fi

# Consultar el tamaño del terminal; útil para líneas serie.
if [ -x /usr/bin/resizewin ] ; then /usr/bin/resizewin -z ; fi

# Mostrar una galletita de la fortuna al iniciar sesión
if [ -x /usr/bin/fortune ] ; then /usr/bin/fortune freebsd-tips ; fi

