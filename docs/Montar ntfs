Monter NTFS en FreeBSD
sudo nano /etc/rc.conf
kld_list="fusefs"

Esto se puede montar en una terminal usando:
kldload fusefs

Ver discos
gpart show /dev/ada2* (o ada1* o ada3*)

Una vez que sepa su disco busque las particiones:
ls -l /dev/ada2*

sudo pkg install fuse fusefs-ntfs-3g
ntfs-3g /dev/ada2s1 /mnt

*Bug* En algunas ocaciones si copiamos archivos al disco ntfs luego de reiniciar los cambios se deshacen. 
