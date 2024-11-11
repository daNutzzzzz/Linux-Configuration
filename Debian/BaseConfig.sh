# Disable Swap
sudo swapoff -a

# Set Timezone
sudo timedatectl set-timezone Europe/London
#sudo ln -f -s /usr/share/zoneinfo/Europe/London /etc/localtime
#sudo dpkg-reconfigure --frontend noninteractive tzdata

# Perform OS Upgrades
# sudo [ -z "$(find -H /var/lib/apt/lists -maxdepth 0 -mtime -7)" ] && sudo apt-get update && sudo apt-get upgrade -y  && sudo reboot
sudo [ -z "$(find -H /var/lib/apt/lists -maxdepth 0 -mtime -0)" ] && sudo apt-get update && sudo apt-get upgrade -y  && sudo reboot

# Check if the file exists
if [ ! -f /etc/ssh/sshd_config ]; then
    echo "Error: /etc/ssh/sshd_config file not found."
    exit 1
fi

# Append the line to the end of the file
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# Restart SSH service (optional, depending on your system)
sudo systemctl restart sshd

# Change Root Password
sudo passwd root
sudo passwd administrator

# Add User to Sudo Group
sudo usermod -aG sudo administrator

# Verify User Belongs to Sudo Group
groups administrator

# QEMU Guest Agent: https://pve.proxmox.com/wiki/Qemu-guest-agent
sudo apt-get install qemu-guest-agent
systemctl start qemu-guest-agent
