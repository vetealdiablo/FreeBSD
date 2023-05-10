#!/bin/bash
sudo pkg update
sudo pkg install -y nano curl wget sudo bash bash-completion zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions fusefs-ntfs fusefs-ext2 
sudo kldload fusefs
sudo echo 'diablo ALL=(ALL) ALL' >> /usr/local/etc/sudoers
sudo echo '%wheel ALL=(ALL) ALL' >> /usr/local/etc/sudoers
sudo echo 'proc	/proc	procfs	rw	0	0' >> /etc/fstab
sudo echo 'nvidia-modeset_load="YES"' >> /boot/loader.conf
sudo echo '#kern.vty=sc' >> /boot/loader.conf
sudo echo 'hw.vga.textmode=1' >> /boot/loader.conf
sudo echo 'dbus_enable="YES"' >> /etc/rc.conf
sudo echo 'gdm_enable="NO"' >> /etc/rc.conf
sudo echo 'sddm_enable="YES"' >> /etc/rc.conf
sudo echo 'gnome_enable="NO"' >> /etc/rc.conf
sudo echo 'kld_list="fusefs"' >> /etc/rc.conf
sudo echo 'cupsd_enable="YES"' >> /etc/rc.conf
sudo pkg install -y xorg nvidia-driver nvidia-settings nvidia-xconfig dbus font-awesome sourcecodepro-ttf firefox
sudo nvidia-xconfig
sudo pkg install -y bspwm sxhkd dmenu rofi lxappearance pcmanfm ranger ueberzug xterm imagemagick feh picom rxvt-unicode zathura zathura-pdf-poppler
sudo pkg install -y xrandr xkill xinit xsetroot wmctrl 
sudo pkg install -y roboto-fonts-ttf droid-fonts-ttf bitstream-vera dejavu terminus-font font-awesome
sudo pkg install -y pulseaudio pulseaudio-alsa pavucontrol alsautils 
cd
git clone https://github.com/vetealdiablo/freebsd/
sudo cp freebsd/configs/idioma/00-keyboard.conf /usr/local/etc/X11/xorg.conf.d/
sudo cp freebsd/configs/idioma/gdm/locale.conf /usr/local/etc/gdm/
sudo cd
sudo mv /etc/login.conf /etc/login.conf.backup
sudo cp freebsd/configs/idioma/login.conf /etc/
sudo cap_mkdb /etc/login.conf
echo "cap_mkdb /etc/login.conf ===> ¡Listo!"
sudo cp freebsd/configs/sddm.conf /usr/local/etc/
echo -e "\e[91m\e[1m¡Todo hecho!\e[0m"

