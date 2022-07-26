# Format full disk

sudo parted -l
sudo parted /dev/sd**
select /dev/sd* ??
mklabel gpt
mkpart primary ext4 0 -0

# Now Format

mkfs.ext4 /dev/sda1

# Now Mount

sudo mkdir -p /mnt/ssd1
sudo mount -t auto /dev/sda1 /mnt/ssd1

# Fix Storage Permissions 
#sudo umount /mnt/ssd1
#sudo chown -R alpha /mnt/ssd1
#sudo mount /mnt/ssd1

# reboot
sudo reboot

#get UUID of disk
blkid

# Add disk to fstab for auto mounting on boot
# sudo cp /etc/fstab /etc/fstab_bu && echo  '/dev/disk/by-uuid/a977e831-84cb-442f-9f2b-9860d4233b8b /mnt/ssd1 ext4 defaults 0 0' >> /etc/fstab
sudo cp /etc/fstab /etc/fstab_bu 
sudo nano /etc/fstab
/dev/disk/by-uuid/a977e831-84cb-442f-9f2b-9860d4233b8b /mnt/ssd1 ext4 defaults 0 0