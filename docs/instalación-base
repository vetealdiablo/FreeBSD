INSTALAR NANO & FUSE (Instalar sin crear usuario para luego tener disponible bash)
sudo pkg update
sudo pkg install nano sudo bash bash-completion fusefs-ntfs fusefs-ext2
--------------------
EDITAR FSTAB
sudo nano /etc/fstab
proc	/proc	procfs	rw	0	0
--------------------
EDITAR LOADER.CONF
sudo nano /boot/loader.conf
nvidia-modeset_load="YES"
linux_load="YES"
#kern.vty=sc
hw.vga.textmode=1
--------------------
EDITAR RC.CONF
It's fusefs_load="YES" in loader.conf OR kld_list="fusefs" in rc.conf. If you need fusefs(5) during boot put it in loader.conf, if not use rc.conf.
hostname="infierno"
keymap="es.kbd"
ifconfig_re0="DHCP"
sshd_enable="YES"
ntpdate_enable="YES"
# Set dumpdev to "AUTO" to enable crash dumps, "NO" to disable
dumpdev="AUTO"
mouse_enable="YES"
dbus_enable="YES"
gdm_enable="YES"
#hald_enable="YES" # Parece obsoleto hace ya unos años
gnome_enable="YES"
kld_list="fusefs"
--------------------
PAQUETES
sudo pkg install xorg nvidia-driver nvidia-settings nvidia-xconfig dbus
sudo nvidia-xconfig
--------------------
EDITAR SUDOERS
sudo nano /usr/local/etc/sudoers
root ALL=(ALL) ALL
usuario ALL=(ALL) ALL
%wheel ALL=(ALL) ALL
--------------------
GNOME
sudo pkg install gnome-desktop gnome3 gdm sourcecodepro-ttf
--------------------
GNOME ESPAÑOL
sudo nano /usr/local/etc/gdm/locale.conf
LANG="es_ES.UTF-8"
LC_CTYPE="es_AR.UTF-8"
LC_MESSAGES="es_AR.UTF-8"

~/.login_conf
me:\                                                                           
       :charset=UTF-8:\                                                   
       :lang=es_AR.UTF-8:

~/.profile
LANG=es_AR.UTF-8;	export LANG
MM_CHARSET=UTF-8;	export MM_CHARSET
LC_CTYPE=es_AR.UTF-8;	export LC_CTYPE
