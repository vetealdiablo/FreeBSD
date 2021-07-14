#!/bin/bash
sudo pkg update
sudo pkg install -y nano git curl wget sudo bash bash-completion zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions fusefs-ntfs fusefs-ext2 
sudo kldload fusefs
sudo mkdir /mnt/ntfs
sudo mkdir /mnt/infierno
sudo mount /dev/ada3p1 /mnt/infierno
sudo chmod -R 777 /mnt/infierno
sudo ntfs-3g /dev/ada2s1 /mnt/ntfs
sudo echo 'diablo ALL=(ALL) ALL' >> /usr/local/etc/sudoers
sudo echo 'cesc ALL=(ALL) ALL' >> /usr/local/etc/sudoers
sudo echo 'spity ALL=(ALL) ALL' >> /usr/local/etc/sudoers
sudo echo '%wheel ALL=(ALL) ALL' >> /usr/local/etc/sudoers
sudo echo 'proc	/proc	procfs	rw	0	0' >> /etc/fstab
sudo echo 'nvidia-modeset_load="YES"' >> /boot/loader.conf
sudo echo '#kern.vty=sc' >> /boot/loader.conf
sudo echo 'hw.vga.textmode=1' >> /boot/loader.conf
sudo echo 'dbus_enable="YES"' >> /etc/rc.conf
sudo echo 'gdm_enable="NO"' >> /etc/rc.conf
sudo echo 'sddm_enable="YES"' >> /etc/rc.conf
sudo echo 'gnome_enable="YES"' >> /etc/rc.conf
sudo echo 'kld_list="fusefs"' >> /etc/rc.conf
sudo echo 'cupsd_enable="YES"' >> /etc/rc.conf
sudo pkg install -y xorg nvidia-driver nvidia-settings nvidia-xconfig dbus font-awesome sourcecodepro-ttf firefox
sudo nvidia-xconfig
echo "\e[91m\e[1m2da etapa de instalación\e[0m"
cd
git clone https://github.com/vetealdiablo/freebsd/
sudo cp freebsd/configs/idioma/00-keyboard.conf /usr/local/etc/X11/xorg.conf.d/
cat freebsd/make/Makefile | xargs -I {} pkg install  -y {}
cd
sudo mv /usr/local/etc/gdm/locale.conf /usr/local/etc/gdm/locale.conf.backup
sudo cp freebsd/configs/idioma/gdm/locale.conf /usr/local/etc/gdm/
sudo cd
sudo mv /etc/login.conf /etc/login.conf.backup
sudo cp freebsd/configs/idioma/login.conf /etc/
sudo cap_mkdb /etc/login.conf
echo "cap_mkdb /etc/login.conf ===> ¡Listo!"
sudo cp freebsd/configs/sddm.conf /usr/local/etc/
#For AC powered devices (PC, etc..)
sudo gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout '0'
#For Battery powered devices (Laptops, Notebooks etc..)
sudo gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout '0
# Cambiar el nombre de usuario por el actual.
sudo chsh -s /usr/local/bin/zsh diablo
sudo reboot
echo -e "\e[91m\e[1m¡Todo hecho! Reiniciamos \e[0m"
