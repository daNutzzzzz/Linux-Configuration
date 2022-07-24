#!/bin/bash

echo -e "\n"
echo "#########################Step0: Meet the prerequisites#######################################"
echo -e "\n"
bash pre/requisites.sh

echo -e "\n"

echo "############################Step1: Install Docker Engine#####################################"
bash docker/install.sh

echo -e "\n"

echo "############Step2: Install cri-dockerd adapter to act as shim between docker and k8s#########"
bash adapter/cri-dockerd.sh

echo -e "\n"

echo "#################Step3: Install Kube components##############################################"
bash kube/install.sh