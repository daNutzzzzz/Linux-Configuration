#!/bin/bash

# Update package lists
apt update -y

# Install NFS server and utilities
apt install nfs-kernel-server nfs-common -y

# Configure NFS server
mkdir /mnt/data
chown nfs:nfs /mnt/data
chmod 777 /mnt/data

# Create /etc/exports file
touch /etc/exports

# Add the following line to the /etc/exports file:
cat <<EOF > /etc/exports
/mnt/data/      10.0.7.0/255.255.255.0(rw,no_root_squash,no_subtree_check,crossmnt,fsid=0)
/mnt/data/      10.0.8.0/255.255.255.0(rw,no_root_squash,no_subtree_check,crossmnt,fsid=0)
/mnt/data/      10.0.9.0/255.255.255.0(rw,no_root_squash,no_subtree_check,crossmnt,fsid=0)
EOF

# Restart NFS services
systemctl restart nfs-kernel-server

# Firewall configuration (optional)
# Adjust firewall rules to allow NFS traffic
ufw allow 2049/tcp
ufw allow 111/tcp
ufw enable

# Verify NFS server
showmount -e