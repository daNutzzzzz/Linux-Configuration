# Install Core Tools
sudo apt-get -y install \
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
## storage
   duf \
## 7zip
   p7zip-full \
## Firewall & Configure
   ufw \
sudo ufw allow ssh && sudo ufw enable

# GDU
curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz \
chmod +x gdu_linux_amd64 \
mv gdu_linux_amd64 /usr/bin/gdu