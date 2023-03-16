# Set Docker containers to autostart.

## Create File
sudo touch /etc/rc.local
sudo chmod +x /etc/rc.local
# sudo nano /etc/rc.local


## Copy the below into rc.local

### Docker1

echo \
"#!/bin/bash \
echo Docker script starts \
#Set PATH to Docker \
export PATH=$PATH:/usr/bin/docker \
for ((waitseconds=0; waitseconds<=300; waitseconds++)); do \
  	(which docker  > /dev/null) && break || sleep 1 \
done \
killall -9 systemd-resolve \
killall -9 systemd-resolve \
killall -9 systemd-resolve \
killall -9 systemd-resolve \
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d pihole \
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d portainer \
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d ddns-updater \
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d smokeping \
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d alertmanager \
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d grafana \
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d librespeed \
#docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d teleport \
#docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d noip_renew \
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d wireguard \
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d rdb-ie \
#docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d unifi-controller \
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d watchtower \
echo Docker script terminated \
exit 0" | sudo tee /home/docker/rc.local > /dev/null

Echo '#!/bin/bash' >> /etc/rc.local
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
Echo 'docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d grafana' >> /etc/rc.local


#!/bin/bash
echo Docker script starts

#Set PATH to Docker
export PATH=$PATH:/usr/bin/docker

for ((waitseconds=0; waitseconds<=300; waitseconds++)); do
        (which docker  > /dev/null) && break || sleep 1
done

killall -9 systemd-resolved
killall -9 systemd-resolved
killall -9 systemd-resolved
killall -9 systemd-resolved
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d pihole
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d portainer
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d ddns-updater
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d smokeping
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d alertmanager
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d grafana
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d librespeed
#docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d teleport
#docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d noip_renew
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d wireguard
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d rdb-ie
#docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d unifi-controller
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d watchtower

echo Docker script terminated
exit 0



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


#!/bin/bash
echo Docker script starts

#Set PATH to Docker
export PATH=$PATH:/usr/bin/docker

for ((waitseconds=0; waitseconds<=300; waitseconds++));
do
        (which docker  > /dev/null) && break || sleep 1
done

docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d portainer
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d nodeexporter
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d cadvisor
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d watchtower
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d nzbhydra
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d sabnzbd
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d radarr
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d sonarr
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d recyclarr
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d lidarr
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d readarr
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d qbittorrent
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d plex-meta-manager

echo Docker script terminated
exit 0



### Nexus Media

Echo '#!/bin/sh' >> /etc/rc.local
Echo '#Set PATH to Docker' >> /etc/rc.local
Echo 'export PATH=$PATH:/share/CACHEDEV1_DATA/.qpkg/container-station/bin' >> /etc/rc.local
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
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d plexpms' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d smokeping' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d tautulli' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d watchtower' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d cadvisor' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d nodeexporter' >> /etc/rc.local
Echo 'docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d redis' >> /etc/rc.local

#!/bin/sh
echo Docker script starts

#Set PATH to Docker
export PATH=$PATH:/share/CACHEDEV1_DATA/.qpkg/container-station/bin

for ((waitseconds=0; waitseconds<=300; waitseconds++)); do
    (which docker  > /dev/null) && break || sleep 1
done

killall -9 avahi-daemon:
killall -9 upnpd
killall -9 dnsmasq
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d pihole
killall -9 avahi-daemon
killall -9 vhusbdx86 
killall -9 upnpd
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d plexpms
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d watchtower
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d portainer
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d nodeexporter
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d cadvisor
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d redis
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d smokeping
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d tautulli

echo Docker script terminated
exit 0




### Nexus App

Echo '#!/bin/sh' >> /etc/rc.local
Echo '#Set PATH to Docker' >> /etc/rc.local
Echo 'export PATH=$PATH:/share/CACHEDEV1_DATA/.qpkg/container-station/bin' >> /etc/rc.local
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




#!/bin/sh
echo Docker script starts

#Set PATH to Docker
export PATH=$PATH:/share/CACHEDEV1_DATA/.qpkg/container-station/bin

for ((waitseconds=0; waitseconds<=300; waitseconds++)); do
    (which docker  > /dev/null) && break || sleep 1
done

killall -9 dnsmasq
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d pihole
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d portainer
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d ddns-updater
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d wireguard
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d heimdall
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d noip_renew
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d unifi-controller
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d watchtower
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d smokeping
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d rdb-insideearth

echo Docker script terminated
exit 0
