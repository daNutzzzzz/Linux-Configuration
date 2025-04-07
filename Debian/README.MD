# Linux-Configuration

This is a list of software and configurations i use on Linux.

# [Debian](Debian/)
![logo](Debian/Images/Debian.png)

## Sources
* [Downloads](https://www.debian.org/distrib/netinst)
* [Manuals](https://www.debian.org/releases/stable/installmanual)

# Download and run Setup.sh
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
