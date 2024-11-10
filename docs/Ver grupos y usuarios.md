# Ver Grupos y Usuarios en FreeBSD

Los usuarios y grupos están almacenados en los archivos `/etc/passwd` y `/etc/group`. Para imprimir una lista de usuarios y grupos, puedes usar los siguientes comandos:

## Para listar solo los usuarios:

```bash
awk -F":" '{print $1}' /etc/passwd
```

## Para listar solo los grupos:

```bash
awk -F":" '{print $1}' /etc/group
```

## Para obtener más detalles (por ejemplo, con los campos completos de `/etc/passwd`):

```bash
awk -F":" '{print $0 $1 $2}' /etc/passwd
```

Estos comandos te permiten obtener información básica o detallada sobre los usuarios y grupos de tu sistema.
