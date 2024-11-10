# Juegos de Windows en FreeBSD

El viejo y conocido **WINE**. En FreeBSD existen dos versiones de WINE. La versión de 64 bits está disponible como el paquete `emulators/wine`, y la versión de 32 bits está disponible como `emulators/i386-wine`. Debes usar la versión de 32 bits, ya que la mayoría de los juegos son de 32 bits, y la versión de 64 bits de WINE no puede ejecutar estos juegos de 32 bits. La instalación en FreeBSD es típica y se realiza de la siguiente manera:

```bash
pkg install i386-wine
```

### Mono + Gecko

Los juegos antiguos/clásicos de Windows suelen guardar tus partidas directamente en las carpetas de instalación bajo directorios llamados ‘SAVE’ o ‘SAVEDGAMES’. Sin embargo, entre 2005 y ahora, los desarrolladores de juegos comenzaron a pensar que sería una "gran" idea almacenarlas en el directorio ‘Mis Documentos’. No hace falta decirte cómo me siento sobre esa "decisión", pero en FreeBSD esto significa que los directorios de partidas guardadas se crean directamente en tu directorio home `~` (en mi caso es `/home/vermaden`). Vaya lío.

[Fuente del artículo](https://vermaden.wordpress.com/2020/10/14/oldschool-gaming-on-freebsd/)


