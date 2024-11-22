Reconstruir la base de datos de login.conf

Después de modificar el archivo login.conf, necesitas reconstruir la base de datos para que los cambios tengan efecto:


Copiar código:
sudo cap_mkdb /etc/login.conf


Configuración de GTK y Qt
Para que las aplicaciones GTK y Qt usen el idioma correctamente, puedes asegurarte de que las variables de entorno apropiadas estén configuradas para el entorno gráfico.

GTK: GTK usa la variable GTK_LANGUAGE para determinar el idioma. Asegúrate de exportar esta variable en tu archivo de configuración de shell (por ejemplo, .bashrc, .zshrc, .profile, etc.):


Copiar código:
export GTK_LANGUAGE=es_AR.UTF-8

Qt: Qt utiliza la variable QT_QPA_PLATFORM y las variables locales del sistema. Si tienes configurado el idioma del sistema correctamente, Qt debería usarlo automáticamente, pero si necesitas forzar esto, puedes añadir lo siguiente en tu archivo de configuración de shell:


Copiar código:
export LANG=es_AR.UTF-8
export LC_ALL=es_AR.UTF-8

6. Reiniciar la sesión
Para que todos estos cambios tengan efecto, lo más probable es que necesites cerrar la sesión y volver a iniciarla, o bien reiniciar el sistema.


¿Necesito otros archivos de configuración?
Con .profile generalmente es suficiente, pero si usas otros shells o entornos, podrías necesitar configurar algunos archivos adicionales dependiendo del shell y las herramientas que uses:

Si usas bash: Si usas una shell como bash, el archivo de configuración correspondiente sería .bash_profile o .bashrc en lugar de .profile. Si tienes bash instalado y usas esta shell, debes agregar las mismas configuraciones allí. Por ejemplo, en .bash_profile o .bashrc:


Copiar código:
export LANG=es_AR.UTF-8
export LC_ALL=es_AR.UTF-8
export GTK_LANGUAGE=es_AR.UTF-8

Si usas zsh: Si usas zsh, debes configurar los archivos .zshrc de manera similar.

Si usas un entorno gráfico (X11): Asegúrate de que las configuraciones del sistema de locales estén reflejadas en el entorno gráfico. En tu caso, como estás usando bspwm y aplicaciones GTK y Qt, es probable que ya estés configurando correctamente los locales. Sin embargo, si las aplicaciones no reflejan el idioma correcto, podrías tener que revisar las configuraciones en los archivos de inicio de tu entorno gráfico (por ejemplo, en los archivos .xprofile, .xinitrc, o directamente en el archivo de configuración del gestor de ventanas bspwm).