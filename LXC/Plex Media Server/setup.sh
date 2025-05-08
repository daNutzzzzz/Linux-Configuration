mkdir -p /mnt/ssd1
mount /dev/sda /mnt/ssd1

# Mount external drive NOT WORKING
lsblk
blkid /dev/sda
#nano /etc/fstab # NOT WORKING
UUID=633fef49-2d67-4da5-84ca-cdb0ea6e3ff5 /mnt/SSD1 ext4 defaults,auto 0 0

# Mount external drive
nano /etc/systemd/system/mnt-ssd1.mount


[Unit]
Description=Mount /mnt/ssd1
Requires=local-fs.target
After=local-fs.target
Before=multi-user.target
# If the device path is stable, you can also add:
# After=dev-disk-by\x2duuid-d3d7bbac\x2d49ec\x2d4c65\x2db102\x2df33c360b92c0.device
# (Escape hyphens with \x2d)

[Mount]
#What=/dev/disk/by-uuid/d3d7bbac-49ec-4c65-b102-f33c360b92c0
What=/dev/sda
Where=/mnt/ssd1
Type=ext4
Options=defaults,auto

[Install]
WantedBy=multi-user.target


systemctl enable mnt-ssd1.mount
reboot now


# Intsall GDU
apt install curl

curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz
chmod +x gdu_linux_amd64
mv gdu_linux_amd64 /usr/bin/gdu

# Create Admin account & group
groupadd -g 1000 administrator
useradd -u 1000 -g 1000 -m administrator
usermod -aG sudo administrator

# Grant the admin user group permissions over drive
chown -R 1000:1000 /mnt/ssd1/docker

# Install NFS client tools
apt install nfs-common

# Add Docker's official GPG key:
apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Configure Docker
https://github.com/daNutzzzzz/Linux-Configuration/blob/main/Docker/Debian%20-%20Ubuntu/Docker-SetDefaultComposeLocation.sh
https://github.com/daNutzzzzz/Linux-Configuration/blob/main/Docker/Debian%20-%20Ubuntu/Docker-Update-Images-Location.bash
echo -e "{\n \"storage-driver\": \"overlay2\"\n}" >> /etc/docker/daemon.json
echo -e "{\n \"storage-driver\": \"overlay2\"\n}" >> /etc/docker/daemon.json