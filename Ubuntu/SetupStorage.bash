# show storage
lsblk

# Format full disk
sudo parted -l
sudo parted /dev/sdb
select /dev/sdb
mklabel gpt
mkpart primary ext4 0 -0

# Now Format
sudo mkfs.ext4 /dev/sdb

# Now Mount
sudo mkdir -p /mnt/ssd1
sudo mount -t auto /dev/sdb /mnt/ssd1

# create docker groupo and add user
# sudo groupadd docker
# sudo usermod -a -G docker docker
# sudo groupmod -n docker alpha

# Fix Storage Permissions 
#sudo umount /mnt/ssd1
sudo chown -R docker /mnt/ssd1/ && sudo chgrp -R docker /mnt/ssd1/

# reboot
sudo reboot

#get UUID of disk
blkid

# Add disk to fstab for auto mounting on boot
# sudo cp /etc/fstab /etc/fstab_bu && echo  '/dev/disk/by-uuid/a977e831-84cb-442f-9f2b-9860d4233b8b /mnt/ssd1 ext4 defaults 0 0' >> /etc/fstab
sudo cp /etc/fstab /etc/fstab_bu 
sudo nano /etc/fstab
/dev/disk/by-uuid/11795ef1-589d-4a77-9c93-8e160657cf02 /mnt/ssd1 ext4 defaults 0 0

# reboot
sudo reboot

