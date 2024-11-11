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
BASE_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/BaseConfig.sh"
TOOLS_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/InstallCoreTools.sh"
MONITORING_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/Configure_Monitoring.sh"
STORAGE_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/SetupStorage.sh"
NFS_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/setup_nfs_server.sh"
SAMBA_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/setup_samba_server.sh"
curl -L "$SETUP_URL" -o setup.sh
curl -L "$BASE_URL" -o BaseConfig.sh
curl -L "$TOOLS_URL" -o InstallCoreTools.sh
curl -L "$MONITORING_URL" -o Configure_Monitoring.sh
curl -L "$STORAGE_URL" -o SetupStorage.sh
curl -L "$NFS_URL" -o SetupStorage.sh
curl -L "$SAMBA_URL" -o SetupStorage.sh
bash ./setup.sh
```

```
sudo apt update -y
sudo apt install -y curl
BASE_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian"
SCRIPTS=(
  "setup.sh"
  "BaseConfig.sh"
  "InstallCoreTools.sh"
  "Configure_Monitoring.sh"
  "SetupStorage.sh"
  "setup_nfs_server.sh"
  "setup_samba_server.sh"
)
for script in "${SCRIPTS[@]}"; do
  curl -L "$BASE_URL/$script" -o "$script"
done
chmod +x *.sh
bash ./setup.sh
```