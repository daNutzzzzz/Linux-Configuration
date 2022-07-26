# Disable Swap
sudo swapoff -a

# Perform OS Upgrades
# sudo [ -z "$(find -H /var/lib/apt/lists -maxdepth 0 -mtime -7)" ] && sudo apt-get update && sudo apt-get upgrade -y  && sudo reboot
sudo [ -z "$(find -H /var/lib/apt/lists -maxdepth 0 -mtime -0)" ] && sudo apt-get update && sudo apt-get upgrade -y  && sudo reboot

# Change Root Password
sudo passwd root