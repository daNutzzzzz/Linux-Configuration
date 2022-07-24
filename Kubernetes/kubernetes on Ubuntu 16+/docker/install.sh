#Title: Docker engine installation script
#Author: Abuharis Salih
#Date: 13-Jul-2022

echo "#########################################################################################################################################################################"
echo "# This is the primary stage of setting up the Kubernetes cluster. There are a number of other container runtimes available such as rkt and containerd                   #"
echo "# In this setup, I used docker as the container runtime. While using docker, make sure you have cri-dockerd adapter installed to integrate Docker Engine with Kubenetes #"
echo "# Read the following documentation for more:                                                                                                                            #"
echo "# - Choose a container engine: https://kubernetes.io/docs/setup/production-environment/container-runtimes/#docker                                                       #"
echo "# - Install Docker Engine: https://docs.docker.com/engine/install/ubuntu/                                                                                               #"
echo "#########################################################################################################################################################################"
echo -e "\n"
echo "*************************************************************************************************************************************************************************"
echo "#                        Before you begin, make sure you have met the OS requirements. This is script is solely written for debian systems.                             #"
echo "*************************************************************************************************************************************************************************"

echo "Let's begin"

echo -e "\n"

echo "Uninstall any old version to avoid conflicts"
sudo apt-get remove \
        docker \
        docker-engine \
        docker.io \
        containerd runc

echo -e "\n"

echo "Installing docker using repository. Setting up repository..."
sudo apt-get update
sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

echo -e "\n"

echo "Adding Official Docker GPG key"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo -e "\n"

echo "Installing docker engine..."
sudo apt-get update
sudo apt-get install \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-compose-plugin

echo -e "\n"

docker version > /dev/null
if [ $? -ne 0 ]
then
    echo "The Docker Engine installation failed. Verify the outputs and execute again"
else
    echo "#############################################################################################"
    echo "#Docker Engine installed Successfully. Let's proceed now with the cri-dockerd adapter setup.#"
    echo "#############################################################################################"
fi
