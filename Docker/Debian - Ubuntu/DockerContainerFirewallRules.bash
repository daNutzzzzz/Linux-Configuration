# add port access requirements to firewall

# All
sudo ufw allow 22/tcp # ssh
sudo ufw allow 8080/tcp # cAdvisor
sudo ufw allow 9000/tcp # portainer
sudo ufw allow 9100/tcp # nodeexporter
sudo ufw allow 61208/tcp # glances

# Docker 01
sudo ufw allow 82/tcp # SmokePing
sudo ufw allow 3000/tcp # Graphana
sudo ufw allow 8001/tcp # DDNS-Updater
sudo ufw allow 9090/tcp # Prometheus

# Docker 02
sudo ufw allow 5076/tcp # nzbhydra
sudo ufw allow 7878/tcp # Radarr
sudo ufw allow 8088/tcp # SABnzbd
sudo ufw allow 8989/tcp # Sonarr
