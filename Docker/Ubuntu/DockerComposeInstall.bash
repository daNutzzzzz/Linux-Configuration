# Nexus Media
killall -9 dnsmasq
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d

# Nexus App
killall -9 dnsmasq
docker-compose -f /share/Container/docker-compose/docker-compose.yml up -d

# docker 01
killall -9 systemd-resolve
killall -9 systemd-resolve
killall -9 systemd-resolve
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d pihole

# docker 02
docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d
