# temp
export COMPOSE_FILE=/mnt/ssd1/docker/docker-compose/docker-compose.yml
source ~/.bashrc  # or source ~/.zshrc

# Perminent
nano /etc/environment
COMPOSE_FILE=/mnt/ssd1/docker/docker-compose/docker-compose.yml

or

echo "COMPOSE_FILE=/mnt/ssd1/docker/docker-compose/docker-compose.yml" >> /etc/environment



