# Configuración de UTF-8 y español en FreeBSD

Para configurar el sistema para que use **UTF-8** y el idioma **español**, sigue estos pasos:

1. **Activar la consola VT**: Primero, para tener soporte de **UTF-8**, necesitas una consola VT. Para habilitarla, agrega la siguiente línea en el archivo `/boot/loader.conf`:

    ```bash
    sudo nano /boot/loader.conf
    ```

    Agrega la línea:

    ```
    hw.vga.textmode=1
    ```

2. **Configurar el teclado en español**: En el archivo `/etc/rc.conf`, asegúrate de tener configurada la siguiente línea para establecer el mapa de teclado en español:

    ```bash
    sudo nano /etc/rc.conf
    ```

    Agrega la línea:

    ```
    keymap="es"
    ```

3. **Configurar el idioma en el sistema**: En el archivo `/etc/login.conf`, necesitas agregar la configuración del idioma y la codificación. Para ello, edita el archivo y agrega la siguiente entrada:

    ```bash
    sudo nano /etc/login.conf
    ```

    Añade la siguiente sección al final del archivo:

    ```
    spanish|Spanish Users Accounts:\
    :charset=UTF-8:\
    :lang=es_ES.UTF-8:
    ```

4. **Reconstruir la base de datos de login.conf**: Para que los cambios en `/etc/login.conf` tengan efecto, ejecuta el siguiente comando:

    ```bash
    sudo cap_mkdb /etc/login.conf
    ```

5. **Modificar el usuario root**: Finalmente, cambia el idioma del usuario `root` para que utilice la configuración en español. Ejecuta el siguiente comando:

    ```bash
    sudo pw user mod root -L spanish
    ```

Con estos pasos, tu sistema FreeBSD debería estar configurado correctamente para usar **UTF-8** y el idioma **español**. ¡Disfruta de tu sistema configurado en español!
