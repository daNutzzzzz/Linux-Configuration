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
SETUP_URL="https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz"
curl -L "$SETUP_URL" -o setup.sh
chmod +x setup.sh
bash ./setup.sh