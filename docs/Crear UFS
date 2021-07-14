-- Notes:
$ means run as normal user
# means run as root

1. List and find the name of your external disk:
$ grep -i disk /var/run/dmesg.boot
OR
# gpart show

-- Output:
Code:

.
.
ada0 ...
ada1 ...
da0 ...
da1 GPT (512G)
.
.


-- Attention: suppose, the 512G is the correct one => da1 is the name, aka /dev/da1

2. Create a GPT partition scheme
# gpart create -s gpt /dev/da1

2.1. Check that everything is OK:
# gpart show da1

-- Output:
Code:

da1 GPT (512G)
- free - (512G)


3. Add a new partition to the partitioning scheme:
# gpart add -t freebsd-ufs -a 1M /dev/da1

-- Notes:
-t type of partition (freebsd-ufs)
-a alignment (to 1MB boundary)

4. Then Format it:
# newfs -U /dev/da1p1

-- Note:
-U (Enable soft updates)

5. Create a mountpoint e.g. /backup
# mkdir /backup

6. Add the new partition to the /etc/fstab
# vi /etc/fstab

7. Add this line to the /etc/fstab
Code:

/dev/da1p1    /backup        ufs    rw    2    2


8. Mount it manually:
# mount /backup

9. Done

0. RTFM
man(1), vi(1), grep(1), mkdir(1), df(1), mount(1), gpart(8), newfs(8), fstab(5)
 

