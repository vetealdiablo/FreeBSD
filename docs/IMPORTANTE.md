**Discos NTFS..
Cuando montamos ntfs mediante ntfs-3g siempre antes de cerrar la sesión o reiniciar/apagar el equipo hay que desmontar el disco ya que de lo contrario, ningún cambio que hemos realizado en el (copiar, mover, etc) no se guardarán.

**COMANDO:**
sudo umount /mnt/ntfs

**Para forzar:**
sudo umount -f /mnt/ntfs

**TTY y gnome**
Si durante una sesión de Gnome abrimos una tty (Ej: Ctrl+Alt+F2) ya no se podrá reiniciar desde el menú de Gnome. Al 19.07.2021 no encontré solución.

