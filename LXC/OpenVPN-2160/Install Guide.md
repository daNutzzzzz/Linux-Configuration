# Acces OpenVPN-2160 Instance
# pyenv shell OpenVPN-2160-01
pct accesss 108

# Enable SSH access - https://www.cyberciti.biz/faq/linux-unix-openssh-block-root-user/#:~:text=To%20disable%20SSH%20logins%20for%20the%20root%20account%3A,server%20in%20order%20to%20deny%20root%20log%20in
#nano /etc/ssh/sshd_config
echo \
"PermitRootLogin yes" | tee /etc/ssh/sshd_config > /dev/null 

# OpenVPN install Guide
https://pve.proxmox.com/wiki/OpenVPN_in_LXC

# Copy client OVPN file out using SCP
/root

# Apply traffic restriction
iptables -A FORWARD -i tun0 -p udp -m multiport --dports 6073,2300:2400,47624 -s 10.21.60.0/24 -d 10.21.60.0/24 -j ACCEPT
iptables -A FORWARD -i tun0 -p tcp -m multiport --dports 6073,2300:2400,47624 -s 10.21.60.0/24 -d 10.21.60.0/24 -j ACCEPT
iptables -A FORWARD -i tun0 -p udp -m multiport --sports 6073,2300:2400,47624 -s 10.21.60.0/24 -d 10.21.60.0/24 -j ACCEPT
iptables -A FORWARD -i tun0 -p tcp -m multiport --sports 6073,2300:2400,47624 -s 10.21.60.0/24 -d 10.21.60.0/24 -j ACCEPT
iptables -A FORWARD -i tun0 -p icmp -s 10.21.60.0/24 -d 10.21.60.0/24 -j ACCEPT
iptables -A FORWARD -i tun0 -s 10.21.60.0/24 -d 10.21.60.0/24 -j DROP
iptables -A FORWARD -i tun0 -s 0.0.0.0/0 -d 0.0.0.0/0 -j DROP

iptables-save
iptables-save > /etc/network/iptables
iptables-apply /etc/network/iptables

# Create script to auto apply on reboot
nano /etc/network/if-up.d/ovpniptables

#!/bin/sh

yes | iptables-apply /etc/network/iptables

chmod +x /etc/network/if-up.d/ovpniptables 

========================
# Check services are running
systemctl | grep openvpn

# restart services
service openvpn stop
service openvpn-iptables stop
service openvpn-server stop
service openvpn start
service openvpn-iptables start
service openvpn-server start

# Server Config Path
/etc/openvpn

# Log Paths
/etc/openvpn/server/openvpn-E2160-status.log
/var/log/openvpn/openvpn_E2160.log

========================= server.conf

# local 10.21.59.249
port 2160
proto udp
dev tun
proto udp4
port 2160
verb 3

### Certificates
ca ca.crt
cert server.crt
key server.key
dh dh.pem
crl-verify crl.pem
tls-crypt tc.key

### Authentication and Ciphers
auth SHA512
cipher AES-256-GCM
tls-version-min 1.2

server 10.21.60.0 255.255.255.0
ifconfig-pool-persist ipp.txt
keepalive 10 120
user nobody
group nogroup
persist-key
persist-tun

### Notify the client that when the server restarts so it
### can automatically reconnect.
explicit-exit-notify 1

### Route Configurations Below
### Override the Client default gateway by using 0.0.0.0/1 and
### 128.0.0.0/1 rather than 0.0.0.0/0. This has the benefit of
### overriding but not wiping out the original default gateway.
### route 10.21.60.0 255.255.255.0

### Logging
status openvpn-E2160-status.log
log /var/log/openvpn/openvpn_E2160.log

### DuplicateCNs allow access control on a less-granular, per user basis.
### Remove # if you will manage access by user instead of device.
duplicate-cn

### Extra Configurations Below
topology subnet

### Prevent DNS leaks on Windows
push "block-outside-dns"

### Push Configurations Below
### push "route 10.21.60.0 255.255.255.0"
### push "dhcp-option DNS 0.0.0.0"
### push "dhcp-option DNS 0.0.0.0"
### push "dhcp-option DNS 9.9.9.9"
### push "dhcp-option DNS 149.112.112.112"
### push "redirect-gateway def1 bypass-dhcp"

================== Client .ovpn config

client
dev tun
proto udp4
remote earthnet2160.insideearth.info 2160
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
auth SHA512
cipher AES-256-GCM
route-nopull
route 10.21.60.0 255.255.255.0
ignore-unknown-option block-outside-dns
explicit-exit-notify 1
verb 3

