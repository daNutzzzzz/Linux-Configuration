#

# Backup /etc/resolv.conf 
cp /etc/docker/daemon.json /etc/docker/daemon.jsonBU

## Create a JSON file
sudo nano /etc/docker/daemon.json

## Copy Contents into file
#{
#    "data-root": "/mnt/ssd1/docker/docker-images",
#    "dns": [
#        "45.90.28.93",
#        "45.90.30.93"
#    ]
#}

{
    "data-root": "/mnt/ssd1/docker/docker-images",
    "dns": [
        "45.90.28.93",
	"2a07:a8c0::",
        "45.90.30.93",
        "2a07:a8c1::"
    ]
}


{
    "data-root": "/mnt/ssd1/docker/docker-images",
    "dns": [
        "45.90.28.93",
	"2a07:a8c0::",
        "45.90.30.93",
        "2a07:a8c1::"
        ],
    "dns-opt": [
        "dns-over-tls"
    ]
}

{
    "data-root": "/mnt/ssd1/docker/docker-images",
    "dns": [
        "45.90.28.0#c99416.dns.nextdns.io",
	"2a07:a8c0::#c99416.dns.nextdns.io",
        "45.90.30.0#c99416.dns.nextdns.io",
        "2a07:a8c1::#c99416.dns.nextdns.io"
        ],
    "dns-opt": [
        "dns-over-tls"
    ]
}

{
    "data-root": "/mnt/ssd1/docker/docker-images",
    "dns": ["45.90.28.93","2a07:a8c0::","45.90.30.93","2a07:a8c1::"],
    "dns-opt": ["dns-over-tls"]
}

# Update /etc/docker/daemon.json
echo "{" >> /etc/resolv.conf
echo "    "data-root": "/mnt/ssd1/docker/docker-images"," >> /etc/resolv.conf
echo "    "dns": [" >> /etc/resolv.conf
echo "        "45.90.28.93"," >> /etc/resolv.conf
echo "        "2a07:a8c0::"," >> /etc/resolv.conf
echo "        "45.90.30.93"," >> /etc/resolv.conf
echo "        "2a07:a8c1::"" >> /etc/resolv.conf
echo "    ]" >> /etc/resolv.conf
echo "}"" >> /etc/resolv.conf


# Update /etc/docker/daemon.json
echo "{" >> /etc/resolv.conf
echo "    "data-root": "/mnt/ssd1/docker/docker-images"," >> /etc/resolv.conf
echo "    "dns": [" >> /etc/resolv.conf
echo "        "45.90.28.93"," >> /etc/resolv.conf
echo "        "45.90.30.93"" >> /etc/resolv.conf
echo "    ]" >> /etc/resolv.conf
echo "}"" >> /etc/resolv.conf

#cat <<EOF > /etc/docker/daemon.json
#search nexus.com
#nameserver 45.90.28.0
#nameserver 2a07:a8c0::
#nameserver 45.90.30.0
#nameserver 2a07:a8c1::
#DNSOverTLS=yes
#EOF

# Be cautious! This overwrites existing nameservers in /etc/resolv.conf
# Consider backing up the original file before running this script.

echo "Updated /etc/resolv.conf with provided nameservers."

# Optional: To restart services that rely on DNS changes (may not be necessary)
# systemctl restart systemd-resolved

## restart Docker or reboot the system
sudo systemctl restart docker
## docker system prune -a
