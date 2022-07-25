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
#sudo chown -R alpha /mt/sda1