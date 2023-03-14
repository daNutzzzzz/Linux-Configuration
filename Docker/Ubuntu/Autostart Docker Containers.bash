# Set Docker containers to autostart.

## Create File
sudo touch /etc/rc.local
sudo chmod +x /etc/rc.local
# sudo nano /etc/rc.local


## Copy the below into rc.local

### Docker1

Echo '#!/bin/sh' >> /etc/rc.local
Echo '#Set PATH to Docker' >> /etc/rc.local
Echo 'export PATH=$PATH:/usr/bin/docker' >> /etc/rc.local
Echo '' >> /etc/rc.local
Echo 'for ((waitseconds=0; waitseconds<=300; waitseconds++)); do' >> /etc/rc.local
Echo '    (which docker  > /dev/null) && break || sleep 1' >> /etc/rc.local
Echo 'done' >> /etc/rc.local
Echo '' >> /etc/rc.local
Echo 'killall -9 systemd-resolve' >> /etc/rc.local
Echo 'killall -9 systemd-resolve' >> /etc/rc.local
Echo 'killall -9 systemd-resolve' >> /etc/rc.local
Echo 'killall -9 systemd-resolve' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d pihole' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d portainer' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d ddns-updater' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d smokeping' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d alertmanager' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d grafana' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d librespeed' >> /etc/rc.local
Echo '#docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d teleport' >> /etc/rc.local
Echo '#docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d noip_renew' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d wireguard' >> /etc/rc.local
Echo '#docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d unifi-controller' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d watchtower' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d rdb-ie' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d noip_renew' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d duplicati' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d grafana' >> /etc/rc.local


### Docker2

Echo '#!/bin/sh' >> /etc/rc.local
Echo '#Set PATH to Docker' >> /etc/rc.local
Echo 'export PATH=$PATH:/usr/bin/docker' >> /etc/rc.local
Echo '' >> /etc/rc.local
Echo 'for ((waitseconds=0; waitseconds<=300; waitseconds++)); do' >> /etc/rc.local
Echo '    (which docker  > /dev/null) && break || sleep 1' >> /etc/rc.local
Echo 'done' >> /etc/rc.local
Echo '' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d portainer' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d nodeexporter' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d cadvisor' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d watchtower' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d nzbhydra' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d sabnzbd' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d radarr' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d sonarr' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d recyclarr' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d lidarr' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d readarr' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d qbittorrent' >> /etc/rc.local
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d plex-meta-manager' >> /etc/rc.local




### Nexus Media

Echo '#!/bin/sh' >> /etc/rc.local
Echo '#Set PATH to Docker' >> /etc/rc.local
Echo 'export PATH=$PATH:/usr/bin/docker' >> /etc/rc.local
Echo '' >> /etc/rc.local
Echo 'for ((waitseconds=0; waitseconds<=300; waitseconds++)); do' >> /etc/rc.local
Echo '    (which docker  > /dev/null) && break || sleep 1' >> /etc/rc.local
Echo 'Echo 'done' >> /etc/rc.local
Echo '' >> /etc/rc.local
Echo 'killall -9 dnsmasq' >> /etc/rc.local
Echo 'killall -9 dnsmasq' >> /etc/rc.local
Echo 'killall -9 dnsmasq' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d pihole' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d portainer' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d plexpms' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d smokeping' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d tautulli' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d watchtower' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d cadvisor' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d nodeexporter' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d redis' >> /etc/rc.local




### Nexus App

Echo '#!/bin/sh' >> /etc/rc.local
Echo '#Set PATH to Docker' >> /etc/rc.local
Echo 'export PATH=$PATH:/usr/bin/docker' >> /etc/rc.local
Echo '' >> /etc/rc.local
Echo 'for ((waitseconds=0; waitseconds<=300; waitseconds++)); do' >> /etc/rc.local
Echo '    (which docker  > /dev/null) && break || sleep 1' >> /etc/rc.local
Echo 'done' >> /etc/rc.local
Echo '' >> /etc/rc.local
Echo 'killall -9 dnsmasq' >> /etc/rc.local
Echo 'killall -9 dnsmasq' >> /etc/rc.local
Echo 'killall -9 dnsmasq' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d pihole' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d portainer' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d unifi-controller' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d watchtower' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d cadvisor' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d nodeexporter' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d redis' >> /etc/rc.local
