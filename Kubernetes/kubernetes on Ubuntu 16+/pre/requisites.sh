#!/bin/bash

echo "Loading the netfilter module"
sudo modprobe br_netfilter

echo "In order for a Linux node's iptables to correctly view bridged traffic, verify that net.bridge.bridge-nf-call-iptables is set to 1 in sysctl config"

cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system