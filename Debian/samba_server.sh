#!/bin/bash

# Update package lists
apt update -y

# Install Samba
apt install samba -y

# Stop Services
systemctl stop nmbd.service
systemctl stop smbd.service

# Disable NetBIOS over IP
systemctl disable nmbd.service

# Copy Original config
mv /etc/samba/smb.conf /etc/samba/smb.conf.orig

# Configure Samba server
#mkdir /mnt/data
mkdir /mnt/data/Multimedia/
chown :sambashare /mnt/data/Multimedia/

# Permission data share
#chmod 777 /mnt/data
chown -R administrator /mnt/data && chgrp -R administrator /mnt/data

# Configure Samba
# nano /etc/samba/smb.conf

# Create the smb.conf file if it doesn't exist
if [ ! -f /etc/samba/smb.conf ]; then
    touch /etc/samba/smb.conf
fi

# Write the configuration to the file
cat <<EOF > /etc/samba/smb.conf
[global]
    server string = $hostname Samba Server
    server role = standalone server
    workgroup = WORKGROUP
    netbios name = debian
    security = user
    dns proxy = no
    wins support = no
    interfaces = lo 
    bind interfaces only = yes
    min protocol = SMB2
    max protocol = SMB3
    disable netbios = yes
    smb ports = 445
    log file = /var/log/samba/smb.log
    max log size = 10000
    log level = 5 passdb:5 auth:5

[Multimedia]
    path = /mnt/data/Multimedia
    browseable = yes
    writable = yes
    guest ok = yes
    read only = no
    create mask = 0666
    directory mask = 0777
    force create mode = 0660
    force directory mode = 2770
    valid users = administrator @administrator

[Archive]
    path = /mnt/data/Archive
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = administrator @administrator

[IEO]
    path = /mnt/data/IEO
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = administrator @administrator

[ISOs]
    path = /mnt/data/ISOs
    browseable = yes
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = administrator @administrator
EOF

# Find the Ethernet interface (considering both eth and ens)
eth_interface=$(ip link show | grep -oP 'eth[0-9]+|ens[0-9]+')

# Insert the interface name into smb.conf
sed -i "s/interfaces = lo/interfaces = lo $eth_interface/g" /etc/samba/smb.conf

# Test config
testparm

# Restart Samba services
systemctl restart smbd
systemctl restart nmbd

# Create a UNIX user
useradd administrator

# Create a Samba user
smbpasswd -a administrator

# Enable a Samba user
smbpasswd -e administrator

done

echo "** Script execution completed. **"

