## Storage

fdisk -l (to find the right device (usually /dev/sd*))

or
# Clean the drive
wipefs --all /dev/sd*

# Clean and Create Partitions - https://www.hostfav.com/blog/index.php/2017/02/01/add-a-new-physical-hard-drive-to-proxmox-ve-4x-5x/
fdisk /dev/sd* (to edit the disk)

	choose d to delete existing partition (you might need to do it several times, until there is no partition anymore)
	then w to write the deletion

fdisk /dev/sd* (to edit the disk again)

	n to create the new partition
	w to write it


pvcreate /dev/sdc1
vgcreate SSD1 /dev/sdc1

# Add in Data Centre via Gui
Click Data CentreClick Storage
Click Add/LVM
Enter ID: SSD1TB-1
Select Vlume Group: SSD1TB-1
Filter to nodes: PXE2

# Add disk to vm
Go to host node
Select vm
Add Disk







# DOCKER

## Storage

sudo fdisk -l (to find the right device (usually /dev/sd*))

# Create FS - https://nubcakes.net/index.php/2019/03/05/how-to-add-storage-to-proxmox/
sudo mkfs.ext4 -L adisk /dev/sd*


# Mount Docker Storage - https://forum.proxmox.com/threads/how-to-mount-existing-disk-to-storage.66559/
sudo mkdir /mnt/SSD1
sudo mount /dev/sdb1 /mnt/SSD1

#get UUID of disk
blkid or note UUID from mkfs

# Record SupoerBlocks
dumpe2fs /dev/sd** | grep -i superblock

# add disk to fstab
sudo nano /etc/fstab



# Make folders if required
sudo mkdir docker
cd docker
sudo mkdir docker-images
cd ..
sudo mkdir download
cd download
sudo mkdir sabnzbd
cd sabnzbd
sudo mkdir complete
sudo mkdir incomplete
cd complete
sudo mkdir TV
sudo mkdir Movie
sudo mkdir Books
sudo mkdir Music
sudo mkdir Misc

# repermission

sudo chown -R docker /mnt/ssd1/ && sudo chgrp -R docker /mnt/ssd1/

# Update Docker-compse if required
