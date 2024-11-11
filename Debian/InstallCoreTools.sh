#!/bin/bash

# Install Core Tools
sudo apt-get update -y
sudo apt-get install -y \
    ## System Monitor
    glances \
    ## HardwareInfo
    dmidecode \
    ## Disk Management Tools
    parted \
    ## Network Management Tools
    iputils-ping \
    net-tools \
    ## Disk Performance Tools
    atop \
    htop \
    iotop \
    bashtop \
    ## Install File Editor
    nano \
    ## Storage
    duf \
    ## 7zip
    p7zip-full \
    ## Firewall & Configure
    ufw

# Check if UFW is installed and enable it
if ! dpkg -s ufw &> /dev/null; then
  echo "UFW is not installed. Installing now..."
  sudo apt-get install ufw -y
fi

sudo ufw enable
sudo ufw allow ssh

# Install GDU
echo "Installing GDU..."
GDU_URL="https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz"
curl -L "$GDU_URL" -o gdu.tgz
tar -xzf gdu.tgz
chmod +x gdu_linux_amd64
mv gdu_linux_amd64 /usr/bin/gdu
rm gdu.tgz  # Clean up temporary file

# Check for errors during installation
if [ $? -ne 0 ]; then
  echo "Error occurred during installation. Please check the logs for more details."
  exit 1
fi
