# https://docs.docker.com/engine/install/ubuntu/
# https://github.com/docker/docker-install

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Set up the repository
sudo apt-get update
sudo apt-get -y install \
   ca-certificates \
   curl \
   gnupg \
   lsb-release
   
# Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# To check if the installation ended successfuly, just run:
docker -v
sudo docker version

# Verify that Docker Engine is installed correctly by running the hello-world image.
# sudo docker run hello-world

# Create Docker Folders & Files
sudo mkdir /mnt/ssd1/docker
sudo mkdir /mnt/ssd1/docker/docker-compose
sudo mkdir /mnt/ssd1/docker/docker-data
sudo mkdir /mnt/ssd1/docker/docker-images
sudo touch /mnt/ssd1/docker/docker-compose/docker-compose.yml
sudo mkdir /mnt/ssd1/download

# Repoint Docker Images Repository and set default DNS 
cd /etc/docker/
sudo touch daemon.json
sudo nano daemon.json

{
    "data-root": "/mnt/ssd1/docker/docker-images",
    "dns": [
        "45.90.28.93",
        "45.90.30.93"
    ]
}


# Restart Docker to pick up new location
sudo systemctl restart docker



# start docker compose
sudo docker compose -f /mnt/ssd1/docker/docker-compose/docker-compose.yml up -d

# Create Docker User and Group
#sudo useradd docker
#sudo passwd docker

# Get ID's for both
id

