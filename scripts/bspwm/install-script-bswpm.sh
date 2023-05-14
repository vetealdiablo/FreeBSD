#!/bin/bash
sudo pkg update
sudo pkg install -y nano ninja cmake curl wget sudo bash bash-completion zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions fusefs-ntfs fusefs-ext2 
sudo kldload fusefs
sudo echo 'diablo ALL=(ALL) ALL' >> /usr/local/etc/sudoers
sudo echo '%wheel ALL=(ALL) ALL' >> /usr/local/etc/sudoers
sudo echo 'proc	/proc	procfs	rw	0	0' >> /etc/fstab
sudo echo 'nvidia-modeset_load="YES"' >> /boot/loader.conf
sudo echo '#kern.vty=sc' >> /boot/loader.conf
sudo echo 'hw.vga.textmode=1' >> /boot/loader.conf
sudo echo 'dbus_enable="YES"' >> /etc/rc.conf
sudo echo 'gdm_enable="NO"' >> /etc/rc.conf
# sudo echo 'sddm_enable="YES"' >> /etc/rc.conf
sudo echo 'gnome_enable="NO"' >> /etc/rc.conf
sudo echo 'kld_list="fusefs"' >> /etc/rc.conf
sudo echo 'cupsd_enable="YES"' >> /etc/rc.conf
# PAQUETES
sudo pkg install -y xorg xrandr xkill xinit xsetroot nvidia-driver nvidia-settings nvidia-xconfig dbus wmctrl font-awesome sourcecodepro-ttf bitstream-vera dejavu nerd-fonts firefox 
sudo pkg install -y bspwm sxhkd dmenu polybar rofi lxappearance pcmanfm py39-ranger py39-ueberzug feh picom rxvt-unicode zathura zathura-pdf-poppler ncurses terminfo-db
sudo pkg install -y pulseaudio pulseaudio-alsa pavucontrol alsa-utils
sudo nvidia-xconfig
cd
git clone https://github.com/vetealdiablo/freebsd/
sudo cp freebsd/configs/idioma/00-keyboard.conf /usr/local/etc/X11/xorg.conf.d/
sudo cp freebsd/configs/idioma/gdm/locale.conf /usr/local/etc/gdm/
sudo cd
sudo mv /etc/login.conf /etc/login.conf.backup
sudo cp freebsd/configs/idioma/login.conf /etc/
sudo cap_mkdb /etc/login.conf
echo "cap_mkdb /etc/login.conf ===> ¡Listo!"
# sudo cp freebsd/configs/sddm.conf /usr/local/etc/
sudo chsh -s /usr/local/bin/bash diablo
echo -e "\e[91m\e[1m¡Todo hecho!\e[0m"

