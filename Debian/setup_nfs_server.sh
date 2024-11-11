#!/bin/bash

# Update package lists
sudo apt update -y

# Install NFS server and utilities
sudo apt install nfs-kernel-server nfs-common -y

# Configure NFS server
sudo mkdir /export/nfs
sudo chown nfs:nfs /export/nfs
sudo chmod 777 /export/nfs

# Edit /etc/exports file
sudo nano /etc/exports

# Add the following line to the /etc/exports file:
/export/nfs *(rw,sync,no_subtree_check,fsid=0)

# Restart NFS services
sudo systemctl restart nfs-kernel-server

# Firewall configuration (optional)
# Adjust firewall rules to allow NFS traffic
sudo ufw allow 2049/tcp
sudo ufw allow 111/tcp
sudo ufw enable

# Verify NFS server
showmount -e