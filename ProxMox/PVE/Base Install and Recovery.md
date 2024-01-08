# Hostname 
proxmox-01

# Change password if required
passwd root

# Disable Swapfile (https://blog.lbdg.me/proxmox-best-performance-disable-swappiness/)
# Check the current value
cat /proc/sys/vm/swappiness

# Define the new one
sysctl vm.swappiness=0

# Disable SWAP, it'll take some times to clean the SWAP area
swapoff -a

# Storage
# Prepare Storage: - https://www.hostfav.com/blog/index.php/2017/02/01/add-a-new-physical-hard-drive-to-proxmox-ve-4x-5x/ | Use this Guide!

# Remove Proxmox Subscription Notice
sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service

# Create Host Config Backup Script
touch /etc/cron.daily/pve_config_backup.sh
chmod 755 /etc/cron.daily/pve_config_backup.sh
mkdir /home/pve-host-01/
nano /etc/cron.daily/pve_config_backup.sh

## script
https://raw.githubusercontent.com/daNutzzzzz/proxmox-stuff/master/prox_config_backup.sh

#Proxmox 1
curl https://hc-ping.com/9ff4f635-82fa-4313-838d-ad57096f1bb3

#Proxmox 2
curl https://hc-ping.com/648a47f4-e0b2-4355-ba67-070f3edf808d

#Proxmox 3
curl https://hc-ping.com/1d044eb7-0372-44e1-873d-ca1cbe5a6f33" | tee /etc/cron.daily/pvehost-backup > /dev/null

# Implement rclone host backup copy to OD
/home/rclone
## Add cron task
## Copy "rclone.conf" from another working location as it contains API keys to /home/rclone/rclone

# How to Update Proxmox Without Subscription
cd /etc/apt/sources.list.d/
cp pve-enterprise.list pve-no-subscription.list
echo "# deb https://enterprise.proxmox.com/debian/pve bullseye pve-enterprise" > pve-enterprise.list
echo \
"deb http://ftp.debian.org/debian bullseye main contrib
deb http://ftp.debian.org/debian bullseye-updates main contrib

# PVE pve-no-subscription repository provided by proxmox.com,
# NOT recommended for production use
deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription

# security updates
deb http://security.debian.org/debian-security bullseye-security main contrib" | tee pve-no-subscription.list > /dev/null

# Update Repo List
apt-get update
# And when that’s done, run software upgrades!
apt-get dist-upgrade
# Note: Always run dist-upgrade, not just “apt-get upgrade.” Dist-upgrade ensures that all the packages and their dependencies are updated. If you just run “apt-get upgrade” things may break. 

==========================
# Rebuild Process

# Load into Proxmox Console
## Configure Host
- Go to Host > Network > Create Linux Bridge > add IP details and link Bridge port > Apply changes
- Go to Host > DNS > Add additional DNS
- Go to Host > Disks > LVM . Confirm all disks are present
- Go to DataCenter > Storage > Add LVM > ID: SSD1 > Volume Group: Select Disk > Click Add
- Go to DataCenter > Storage > Add LVM > ID: HDD1-1TB > Volume Group: Select Disk > Click Add
## Create & Configure Donor VM
### https://manjaro.site/how-to-create-a-new-virtual-machine-from-an-existing-disk-image-in-proxmox/#:~:text=Steps%20to%20Create%20a%20New%20Virtual%20Machine%20from,...%203%20Step%203.%20Change%20the%20VM%20configuration
## - Right Click Host > Create VM > Name: Docker-01 > ID: 100 > OS: None > Disks: Local-LVM - 1Gb > CPU - 2 Cores > MEM: 6Gb > Network: vmbr1
## - Click VM Docker-02 > Hardware > Disk local-lvm 1G > Remove
## - SSH to /etc/pve/qemu-server/
cd /etc/pve/qemu-server/
cd /etc/pve/lxc
## - nano VM file, likely "100.conf"
## - Add:
## scsi0: SSD1:vm-100-disk-0,size=21.47G,ssd=1
scsi0: SSD1:vm-100-disk-0,size=32.21G,ssd=1
scsi1: SSD1:vm-100-disk-1,size=32.21G,ssd=1
scsi2: HDD1-1TB:vm-100-disk-0,size=912.68G
- Click VM Docker-02 > Options > Boot Order: scsi0

# Start VM

# Record SupoerBlocks
dumpe2fs /dev/sd** | grep -i superblock

