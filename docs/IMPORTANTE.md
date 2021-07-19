**Discos NTFS**

Cuando montamos ntfs mediante el comando de fusefs (ntfs-3g) siempre antes de cerrar la sesión o reiniciar/apagar el equipo hay que desmontar el disco ya que de lo contrario, si copiamos o movimos archivos los cambios no se guardarán y podríamos perder información importante.

**Comando:**

`sudo umount /mnt/ntfs`

**Para forzar:**

`sudo umount -f /mnt/ntfs`

**TTY & Gnome**

Si durante una sesión de Gnome abrimos una tty (Ej: Ctrl+Alt+F2) ya no se podrá reiniciar desde el menú de Gnome. Al 19.07.2021 no encontré solución.

