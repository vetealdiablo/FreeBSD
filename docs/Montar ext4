First edit /etc/devfs.rules and add the following:
[localrules=5]
add path ‘da*’ mode 0660 group operator
*ESTE PASO NO FUE NECESARIO*


Then edit /etc/rc.conf and enable the devfs ruleset
sudo nano /etc/rc.conf
devfs_system_ruleset="localrules"

After that we need to tweak our sysctl settings to allow mounting by unprivileged users.
Add the following to your /etc/sysctl.conf:
sudo nano /etc/sysctl.conf
vfs.usermount=1

To make the changes take effect immediately run:
sudo sysctl vfs.usermount=1

Next we want to install the fusefs driver
sudo pkg install fusefs-ext2

After that we need to load the driver at bootup.
Add the following to your /boot/loader.conf:
sudo nano /boot/loader.conf
fuse_load="YES"

Then create a directory which is accessible by your user:
sudo mkdir /mnt/ext4

And own the directory
sudo chown youruser:youruser /mnt/ext4

Last to mount your actual EXT Volume, run the following:
fuse-ext2 -o rw+ /dev/DEVICENAME /mnt/ext4

DEVICENAME=ada3s1 *gpart show

FUENTE
https://freebsd81949087.wordpress.com/2018/07/27/mouting-linux-filesystems-ext2-ext3-ext4/

