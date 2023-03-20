# show storage
sudo touch /mnt/ssd1/Scripts/Monitoring/StorageMonitor.sh
sudo nano /mnt/ssd1/Scripts/Monitoring/StorageMonitor.sh

#!/bin/bash
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=90
if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
    mail -s 'Disk Space Alert' dan.durden@outlook.com << EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
EOF
fi


# enable to execute
sudo chmod +x StorageMonitor.sh

# add to crontab
#sudo nano /etc/crontab
crontab -e
#@daily	~/StorageMonitor.sh
@daily	/mnt/ssd1/Scripts/Monitoring/StorageMonitor.sh

/mnt/ssd1/docker/docker-scripts/noip_renew.sh
