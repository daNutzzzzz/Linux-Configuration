# Check if the file exists
if [ ! -f /etc/ssh/sshd_config ]; then
    echo "Error: /etc/ssh/sshd_config file not found."
    exit 1
fi

# Append the line to the end of the file
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# Restart SSH service (optional, depending on your system)
systemctl restart sshd

# Disable Swap
swapoff -a

# Set Timezone
timedatectl set-timezone Europe/London
#sudo ln -f -s /usr/share/zoneinfo/Europe/London /etc/localtime
#sudo dpkg-reconfigure --frontend noninteractive tzdata

# corerect sourcews if using iso installer
sed -i '/^deb cdrom:/s/^/#/' /etc/apt/sources.list

sh -c '
echo "deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware" > /etc/apt/sources.list'

# Perform OS Upgrades
# sudo [ -z "$(find -H /var/lib/apt/lists -maxdepth 0 -mtime -7)" ] && sudo apt-get update && sudo apt-get upgrade -y  && sudo reboot
[ -z "$(find -H /var/lib/apt/lists -maxdepth 0 -mtime -0)" ] && apt-get update && apt-get upgrade -y  && reboot

#set DNS - https://learnubuntu.com/change-dns-server/
# Backup /etc/resolv.conf 
cp /etc/resolv.conf /etc/resolv.confBU

# Update /etc/resolv.conf with provided nameservers
#echo "nameserver 45.90.28.0" >> /etc/resolv.conf
#echo "nameserver 2a07:a8c0::" >> /etc/resolv.conf
#echo "nameserver 45.90.30.0" >> /etc/resolv.conf
#echo "nameserver 2a07:a8c1::" >> /etc/resolv.conf

# Add the following line to the /etc/systemd/resolved.conf file:
#cat <<EOF > /etc/resolv.conf
#search nexus.com
#nameserver 45.90.28.0
#nameserver 2a07:a8c0::
#nameserver 45.90.30.0
#nameserver 2a07:a8c1::
#DNSOverTLS=yes
#EOF

apt install curl
sh -c "$(curl -sL https://nextdns.io/install)"
options:
i
c99416
y
n
y
y
y

#nextdns start
#nextdns stop
#nextdns restart
#nextdns log

# Change Root Password
passwd root
passwd administrator

# Add User to Sudo Group
usermod -aG sudo administrator

# Verify User Belongs to Sudo Group
groups administrator

# QEMU Guest Agent: https://pve.proxmox.com/wiki/Qemu-guest-agent
apt-get install qemu-guest-agent
systemctl start qemu-guest-agent
