# Solución al problema de "su: Sorry" en FreeBSD

Cuando ejecutamos el comando `su` con un usuario que no pertenece al grupo `wheel`, el siguiente mensaje de error aparece:

```
$ su
su: Sorry
```

Lo peor de todo es que, dado que no puedes cambiar a la cuenta de **root**, no podrás agregar el usuario actual al grupo `wheel`.

Este post te mostrará una forma fácil de solucionar este problema.

## Solución 1: Agregar el usuario al grupo `wheel` directamente

Para solucionar el problema, puedes agregar el usuario al grupo `wheel` usando el siguiente comando con permisos de **root**:

```bash
sudo pw usermod usuario -G wheel
```

## Solución 2: Usar el modo de usuario único

Si no puedes acceder como root, puedes reiniciar FreeBSD en **modo de usuario único** y luego realizar el cambio como root. A continuación te explicamos cómo hacerlo:

### Paso 1: Reiniciar el servidor y entrar en modo de usuario único

Reinicia el servidor y presiona **2** para iniciar en **modo de usuario único**.

### Paso 2: Hacer el sistema de archivos escribible

Ejecuta el siguiente comando para hacer que el sistema de archivos sea escribible:

```bash
mount -u -w /
```

### Paso 3: Agregar el usuario al grupo `wheel`

Suponiendo que tu usuario se llama `sysadmin`, ejecuta el siguiente comando para agregarlo al grupo `wheel`:

```bash
pw usermod sysadmin -G wheel
```

### Paso 4: Reiniciar el servidor y probar el comando `su`

Reinicia el servidor y prueba el comando `su` con el siguiente procedimiento:

```bash
$ su
Password:
root@uss01:/usr/home/sysadmin #
```

Como puedes ver en el ejemplo anterior, el comando `su` ahora cambia a la cuenta de **root** cuando se ejecuta con el usuario `sysadmin`.
