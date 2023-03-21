#

## Create a JSON file
sudo nano /etc/docker/daemon.json

## Copy Contents into file
{
"data-root": "/mnt/ssd1/docker/docker-images"
}

## restart Docker or reboot the system
sudo systemctl restart docker
## docker system prune -a