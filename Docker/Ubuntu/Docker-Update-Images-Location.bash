#

## Create a JSON file
sudo nano /etc/docker/daemon.json

## Copy Contenetins into file
{
"data-root": "/mnt/ssd1/docker/docker-images"
}

## restart Docker or reboot the system
sudo systemctl restart docker
## docker system prune -a





# Set Docker containers to autostart.

## Create File
sudo touch /etc/rc.local
sudo chmod +x /etc/rc.local
sudo nano /etc/rc.local


## Copy the below into rc.local

== Docker1

#!/bin/sh
#Set PATH to Docker
export PATH=$PATH:/usr/bin/docker

for ((waitseconds=0; waitseconds<=300; waitseconds++)); do
    (which docker  > /dev/null) && break || sleep 1
done

killall -9 dnsmasq
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d portainer
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d ddns-updater
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d smokeping
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d alertmanager
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d grafana
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d librespeed
# sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d teleport
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d noip_renew
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d wireguard
# sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d unifi-controller
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d watchtower
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d rdb-ie
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d noip_renew
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d duplicati



== Docker2

#!/bin/sh
#Set PATH to Docker
export PATH=$PATH:/usr/bin/docker

for ((waitseconds=0; waitseconds<=300; waitseconds++)); do
    (which docker  > /dev/null) && break || sleep 1
done

killall -9 dnsmasq
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d portainer
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d pihole
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d ddns-updater
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d smokeping
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d alertmanager
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d grafana
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d librespeed
# sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d teleport
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d noip_renew
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d wireguard
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d watchtower
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d rdb-ie
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d noip_renew
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d duplicati



== Nexus Media

#!/bin/sh
#Set PATH to Docker
export PATH=$PATH:/usr/bin/docker

for ((waitseconds=0; waitseconds<=300; waitseconds++)); do
    (which docker  > /dev/null) && break || sleep 1
done

killall -9 dnsmasq
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d pihole
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d portainer
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d plexpms
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d smokeping
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d tautulli
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d watchtower
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d cadvisor
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d nodeexporter
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d redis
 



== Nexus App

#!/bin/sh
#Set PATH to Docker
export PATH=$PATH:/usr/bin/docker

for ((waitseconds=0; waitseconds<=300; waitseconds++)); do
    (which docker  > /dev/null) && break || sleep 1
done

killall -9 dnsmasq
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d pihole
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d portainer
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d unifi-controller
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d watchtower
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d cadvisor
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d nodeexporter
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d redis
