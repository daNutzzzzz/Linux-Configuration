# Install parted
apt install parted

# Partition new disk
parted /dev/sdb mklabel gpt mkpart primary 0% 100%

# format to ext4
mkfs.ext4 /dev/sdb1

# create mountpoint
mkdir -p /mnt/ssd1

# Mount external drive NOT WORKING
lsblk
blkid /dev/sda
#nano /etc/fstab # NOT WORKING
echo "#SSD1" >> /etc/fstab
echo "UUID=633fef49-2d67-4da5-84ca-cdb0ea6e3ff5 /mnt/ssd1 ext4 defaults,auto 0 0" >> /etc/fstab

# Reload deamon
systemctl daemon-reload


# create folder structure
mkdir -p /mnt/ssd1
mkdir -p /mnt/ssd1/docker
mkdir -p /mnt/ssd1/docker/docker-compose
mkdir -p /mnt/ssd1/docker/docker-data
mkdir -p /mnt/ssd1/docker/docker-images

# Grant the admin user group permissions over drive
chown -R 1000:1000 /mnt/ssd1/docker

# Install NFS client tools
apt install nfs-common

##############
## GPU transcoding Tools (install on PVE host)
##############

# Tone Mapping
https://ffmpeg.org/ffmpeg-filters.html#Tone-mapping
http://underpop.online.fr/f/ffmpeg/help/tonemap.htm.gz

## GPU Passtrhough

# Intel GPU
apt install intel-gpu-tools
intel_gpu_top

# Nvidia
apt install nvidia-detect
nvidia-detect

apt search nvidia-driver
apt install nvidia-driver
nvidia-smi

## apt install firmware-misc-nonfree

# AMD
apt install amdgpu-top
amdgpu-top