#!/bin/bash

# Update package lists
apt update -y

# Install NFS server and utilities
apt install nfs-kernel-server nfs-common -y

# Configure NFS server
mkdir /export/nfs
chown nfs:nfs /export/nfs
chmod 777 /export/nfs

# Edit /etc/exports file
nano /etc/exports

# Add the following line to the /etc/exports file:
/export/nfs *(rw,sync,no_subtree_check,fsid=0)

# Restart NFS services
systemctl restart nfs-kernel-server

# Firewall configuration (optional)
# Adjust firewall rules to allow NFS traffic
ufw allow 2049/tcp
ufw allow 111/tcp
ufw enable

# Verify NFS server
showmount -e