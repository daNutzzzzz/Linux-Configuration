#!/bin/bash

echo "###########################################################################################"
echo "# Verify the MAC address and product UUID are unique for every node                       #"
echo "# \$ip link                                                                               #"
echo "# \$sudo cat /sys/class/dmi/id/product_uuid                                               #"
echo "# Also, make sure the nodes are reaching each other                                       #"
echo "# Port 6443 must be open in the nodes                                                     #"
echo "###########################################################################################"

echo -e "\n"

echo "###############################################"
echo "# Installing Kubeadm | Kubelet | Kubectl      #"
echo "# Kubeadm: For bootstrapping K8s              #"
echo "# Kubelet: K8s agents on worker nodes         #"
echo "# Kubectl: Control tool to manage k8s objects #"
echo "###############################################"

echo -e "\n"

sudo apt-get update
sudo apt-get install -y \
        apt-transport-https \
        ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

#Hold the below tools from being accidentally undergo updates
sudo apt-mark hold kubelet kubeadm kubectl
