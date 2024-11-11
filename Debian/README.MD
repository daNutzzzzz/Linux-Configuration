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
echo "Settingup Debian..."
apt update && apt -y install curl
SETUP_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/setup.sh"
BASE_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/BaseConfig.sh"
TOOLS_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/InstallCoreTools.sh"
MONITORING_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/Configure_Monitoring.sh"
STORAGE_URL="https://raw.githubusercontent.com/daNutzzzzz/Linux-Configuration/refs/heads/main/Debian/SetupStorage.sh"
curl -L "$SETUP_URL" -o setup.sh
curl -L "$BASE_URL" -o setup.sh
curl -L "$TOOLS_URL" -o setup.sh
curl -L "$MONITORING_URL" -o setup.sh
curl -L "$STORAGE_URL" -o setup.sh
chmod +x setup.sh
clear
bash ./setup.sh