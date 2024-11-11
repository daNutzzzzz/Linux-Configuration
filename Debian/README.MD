# Linux-Configuration

This is a list of software and configurations i use on Linux.

# [Debian](Debian/)
![logo](Debian/Images/Debian.png)

## Sources
* [Downloads](https://www.debian.org/distrib/netinst)
* [Manuals](https://www.debian.org/releases/stable/installmanual)

## Config
* [Debian](Debian/)

# Download and run Setup.sh
```
apt update && apt -y install curl
SETUP_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/setup.sh"
BASE_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/baseconfig.sh"
TOOLS_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/coretools.sh"
MONITORING_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/monitoring.sh"
STORAGE_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/storage.sh"
NFS_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/nfs_server.sh"
SAMBA_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/samba_server.sh"
curl -L "$SETUP_URL" -o setup.sh
curl -L "$BASE_URL" -o BaseConfigonfig.sh
curl -L "$TOOLS_URL" -o coretools.sh
curl -L "$MONITORING_URL" -o monitoring.sh
curl -L "$STORAGE_URL" -o storage.sh
curl -L "$NFS_URL" -o nfs_server.sh
curl -L "$SAMBA_URL" -o samba_server.sh
bash ./setup.sh
```

```
sudo apt update -y
sudo apt install -y curl
BASE_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian"
SCRIPTS=(
  "setup.sh"
  "baseconfig.sh"
  "coretools.sh"
  "monitoring.sh"
  "storage.sh"
  "nfs_server.sh"
  "samba_server.sh"
)
for script in "${SCRIPTS[@]}"; do
  curl -L "$BASE_URL/$script" -o "$script"
done
chmod +x *.sh
bash ./setup.sh
```