##################
##################
# Proxmox Host
##################
##################

##############
## GPU transcoding Tools (install on PVE host)

# Configure Proxmox host # https://andrewferguson.net/2022/06/18/plex-proxmox-vm-with-nvidia-gpu-passthrough/
lspci -nnv | grep VGA
lspci -k | grep -EA3 'VGA|3D|Display'

	
lspci -s 42:00

# Get the device ID's
lspci -s 42:00 -n

# Add the device ID's the below Grun command and paste
nano /etc/default/grub

#GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on iommu=pt pcie_acs_override=downstream,multifunction nofb nomodeset video=vesafb:off,efifb:off"
`GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on pcie_acs_override=downstream,multifunction video=efifb:off video=vesa:off vfio-pci.ids=****:****,****:**** vfio_iommu_type1.allow_unsafe_interrupts=1 kvm.ignore_msrs=1 modprobe.blacklist=radeon,nouveau,nvidia,nvidiafb,nvidia-gpu"`
# Note: if you have an AMD CPU, then use amd_iommu=on instead of intel_iommu=on.

update-grub

nano /etc/modules
`vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd`
	
update-initramfs -u -k all

reboot now

dmesg | grep -e DMAR -e IOMMU
lsmod | grep vfio

##################
##################
# VM Configuration
##################
##################

##################
# Hardware Options
Machine: q35
version: latest
vIOMMU: Intel (AMD compatible)

PCI device:
All Functions
ROM-Bar
PCI-Epress

##################
##################
# Plex VM
##################
##################

# confirm you can see the GPU's
lspci -nnv | grep VGA

##################
# Install and configure Storage

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


## Install Drivers

##################

## Install Intel GPU Drivers


## Install Intel GPU Tools
apt install intel-gpu-tools

##################

## Install Nvidia Drivers
# Uninstall - /usr/bin/nvidia-uninstall
#apt search nvidia-driver
# nvidia-driver-525 nvidia-dkms-525
apt install nvidia-driver nvidia-kernel-dkms
## apt install firmware-misc-nonfree

## Install Nvidia Tools
apt install nvidia-detect nvidia-utils
apt install nvtop

## Blacklist nouveau
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

##################

## Install AMD GPU Drivers

## Install AMD GPU Tools
apt install amdgpu-top
amdgpu-top

##################

## Install NVIDIA Container Toolkit # https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

apt-get update
apt-get install -y nvidia-container-toolkit

##################

reboot now

##################


##################
# Docker

## Docker compose

    plexpms:
        container_name: plexpms
        hostname: PlexPMS
        environment:
            - 'NVIDIA_VISIBLE_DEVICES=all'
            - 'NVIDIA_DRIVER_CAPABILITIES=compute,video,utility'
        deploy:
          resources:
            reservations:
              devices:
                - driver: nvidia
                  count: 1
                  capabilities: [gpu]
        devices:
            - '/dev/dri/:/dev/dri/'
#            - '/dev/dri/card0:/dev/dri/card0'
#            - '/dev/dri/card0:/dev/dri/card1'
#            - '/dev/dri/card0:/dev/dri/card2'
#            - '/dev/dri/card0:/dev/dri/renderD128'
#            - '/dev/dri/card0:/dev/dri/renderD129'
            - /dev/nvidia0:/dev/nvidia0
            - /dev/nvidia-caps:/dev/nvidia-caps
            - /dev/nvidiactl:/dev/nvidiactl
            - /dev/nvidia-uvm:/dev/nvidia-uvm
            - /dev/nvidia-uvm-tools:/dev/nvidia-uvm-tools
            - /dev/nvidia-modeset:/dev/nvidia-modeset # May be needed
        volumes:
            - '/dev/shm:/Transcode'


##################
## Plex Configuration

# Tone Mapping
https://ffmpeg.org/ffmpeg-filters.html#Tone-mapping
http://underpop.online.fr/f/ffmpeg/help/tonemap.htm.gz

#Trasncoder Speed
https://support.plex.tv/articles/transcoder/


##################
##################
##################

## GPU Commands

# Intel GPU commands
intel_gpu_top

# Nvidia
nvidia-detect
nvidia-utils
nvidia-smi
nvtop

# AMD
amdgpu-top