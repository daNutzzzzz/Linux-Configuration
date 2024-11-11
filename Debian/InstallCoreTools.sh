#!/bin/bash

# Install Core Tools
apt-get update -y
apt-get install -y \
  glances \
  dmidecode \
  parted \
  iputils-ping \
  net-tools \
  atop \
  htop \
  iotop \
  bashtop \
  nano \
  duf \
  p7zip-full \
  ufw
  
# Check if UFW is installed and enable it
if ! dpkg -s ufw &> /dev/null; then
  echo "UFW is not installed. Installing now..."
  apt-get install ufw -y
fi

ufw default allow incoming
ufw default deny outgoing
ufw enable
ufw allow ssh

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
