# add port access requirements to firewall
sudo ufw allow 81/tcp # Heimdall
sudo ufw allow 82/tcp # SmokePing
sudo ufw allow 5076/tcp # nzbhydra
sudo ufw allow 8001/tcp # DDNS-Updater
sudo ufw allow 9000/tcp # portainer
sudo ufw allow 61208/tcp # glances