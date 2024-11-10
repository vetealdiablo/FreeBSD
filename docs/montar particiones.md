# Montar Particiones de Tipo Ext2, Ext3 y Ext4 en FreeBSD

Para montar particiones de tipo Ext2, Ext3 y Ext4 en FreeBSD, sigue estos pasos:

### 1. Soporte de solo lectura para Ext4:
Para agregar soporte de solo lectura para particiones Ext4, instala el siguiente paquete:

```bash
pkg install fusefs-ext4fuse
```

### 2. Soporte completo para Ext2, Ext3 y Ext4:
Para agregar soporte completo (lectura y escritura) para sistemas de archivos Ext2, Ext3 y Ext4, instala el siguiente paquete:

```bash
pkg install sysutils/fusefs-ext2
```

### 3. Cargar el módulo de kernel para Ext2:
Para cargar o activar el módulo de kernel de Ext2, utiliza el siguiente comando:

```bash
kldload ext2fs
```

### 4. Habilitar el soporte del módulo de forma permanente:
Para que el soporte de Ext2 se cargue automáticamente al iniciar el sistema, agrega el siguiente parámetro a tu archivo `/etc/rc.conf`:

```bash
kld_list="ext2fs"
```

### 5. Montar la partición:
Finalmente, monta la partición usando el siguiente comando. Asegúrate de ajustar las rutas y dispositivos según corresponda:

```bash
mount -t ext2fs /dev/ada3s1 /mnt/ext4
```

Con estos pasos, podrás montar particiones de tipo Ext2, Ext3 y Ext4 en FreeBSD.

