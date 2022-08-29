# show storage
sudo touch StorageMonitor.sh
sudo nano StorageMonitor.sh

#!/bin/bash
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=90
if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
    mail -s 'Disk Space Alert' mailid@domainname.com << EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
EOF
fi


# enable to execute
sudo chmod +x StorageMonitor.sh

# add to crontab
sudo nano /etc/crontab
@daily ~/StorageMonitor.sh