# Set Docker containers to autostart.

## Create File
sudo touch /etc/rc.local
sudo chmod +x /etc/rc.local
# sudo nano /etc/rc.local


## Copy the below into rc.local


### Docker1

echo \
"#!/bin/bash
echo "======================"
echo "Docker script starting"
echo "======================"

# Set PATH to Docker
export PATH=$PATH:/usr/bin/docker

# Wait for Docker to be available
for ((waitseconds=0; waitseconds<=300; waitseconds++));
do
    (which docker > /dev/null) && break || sleep 1
done

# Function to check and start container if not running
start_container_if_not_running() {
    local container_name=$1

    # Check if container exists and is running
    if docker ps --format '{{.Names}}' | grep -q "^${container_name}\$"; then
        echo "Container $container_name is already running"
    else
        echo "Starting container $container_name"
        docker compose up -d "$container_name"

        # Verify container started successfully
        sleep 2
        if ! docker ps --format '{{.Names}}' | grep -q "^${container_name}\$"; then
            echo "Warning: Failed to start container $container_name"
            return 1
        fi
    fi
    return 0
}

# List of containers to check/start
containers=("portainer" "ddns-updater" "watchtower" "wireguard" "dufs" "smokeping" "gitea" "torvpn" "torbrow" "librespeed" "thelounge")

# Process each container
for container in "${containers[@]}"; do
    if ! start_container_if_not_running "$container"; then
        echo "Error occurred with container $container"
    fi
done

echo "======================"
echo "Docker script completed"
echo "======================"
exit 0" | sudo tee /home/docker/rc.local > /dev/null

# Docker 2

echo \
"#!/bin/bash
echo "======================"
echo "Docker script starting"
echo "======================"

# Set PATH to Docker
export PATH=$PATH:/usr/bin/docker

# Wait for Docker to be available
for ((waitseconds=0; waitseconds<=300; waitseconds++));
do
    (which docker > /dev/null) && break || sleep 1
done

# Function to check and start container if not running
start_container_if_not_running() {
    local container_name=$1

    # Check if container exists and is running
    if docker ps --format '{{.Names}}' | grep -q "^${container_name}\$"; then
        echo "Container $container_name is already running"
    else
        echo "Starting container $container_name"
        docker compose up -d "$container_name"

        # Verify container started successfully
        sleep 2
        if ! docker ps --format '{{.Names}}' | grep -q "^${container_name}\$"; then
            echo "Warning: Failed to start container $container_name"
            return 1
        fi
    fi
    return 0
}

# List of containers to check/start
containers=("portainer" "watchtower" "flaresolverr" "prowlarr" "qbittorrentvpn" "sabnzbd" "radarr" "readarr" "sonarr" "sonarr-anime" "lidarr" "whisparr" "whisparrv3" "recyclarr" "shinkro-danjd" "shinkro-home" "shinkro-xxx" "plexpms" "pmm-mv" "pmm-tv" "pmm-tv-anime" "plexmc" "tautulli" "navidrome" "bonob")

# Process each container
for container in "${containers[@]}"; do
    if ! start_container_if_not_running "$container"; then
        echo "Error occurred with container $container"
    fi
done

echo "======================"
echo "Docker script completed"
echo "======================"
exit 0" | sudo tee /home/docker/rc.local > /dev/null





==================================================


killall -9 avahi-daemon:
killall -9 upnpd
killall -9 dnsmasq
killall -9 avahi-daemon
killall -9 vhusbdx86 
killall -9 upnpd



