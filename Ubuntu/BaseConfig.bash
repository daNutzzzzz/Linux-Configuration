# Disable Swap
sudo swapoff -a

# Perform OS Upgrades
# sudo [ -z "$(find -H /var/lib/apt/lists -maxdepth 0 -mtime -7)" ] && sudo apt-get update && sudo apt-get upgrade -y  && sudo reboot
sudo [ -z "$(find -H /var/lib/apt/lists -maxdepth 0 -mtime -0)" ] && sudo apt-get update && sudo apt-get upgrade -y  && sudo reboot

# Change Root Password
sudo passwd root
sudo passwd docker

# Add User to Sudo Group
sudo usermod -aG sudo docker

# Verify User Belongs to Sudo Group
groups docker

# QEMU Guest Agent: https://pve.proxmox.com/wiki/Qemu-guest-agent
sudo apt-get install qemu-guest-agent
systemctl start qemu-guest-agent
