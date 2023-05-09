======= clone process

# If cloning, follow these steps
## rename data folder
cd /mnt/ssd1
rn rdb-**-01 rdb-tw-01

## update token
nano /mnt/ssd1/rdb-tw-01/data/core/settings.json

## update serviced strart
nano /etc/systemd/system/red@.service

## List instalations
pyenv versions

## delete old virtual env
## pyenv virtualenv-delete rdb-**-01

#update bot to autostart - https://docs.discord.red/en/stable/autostart_systemd.html
systemctl start red@rdbtw01
systemctl enable red@rdbtw01

systemctl stop red@rdpc01
systemctl disable red@rdbpc01

# edit
nano /root/.config/Red-DiscordBot/config.json

======= now follow the install process

# Enable SSH access - https://www.cyberciti.biz/faq/linux-unix-openssh-block-root-user/#:~:text=To%20disable%20SSH%20logins%20for%20the%20root%20account%3A,server%20in%20order%20to%20deny%20root%20log%20in
#nano /etc/ssh/sshd_config
echo \
"PermitRootLogin yes" | tee /etc/ssh/sshd_config >> /dev/null 

## create new virtual env
pyenv virtualenv rdb-tw-01

# Access RBD TIB Instance
pyenv shell rdb-tw-01

# Install Guide Red Discord Bot
## https://docs.discord.red/en/stable/install_guides/ubuntu-non-lts.html
## https://readthedocs.org/projects/reddocs/downloads/pdf/latest/
python -m pip install -U pip wheel
python -m pip install -U Red-DiscordBot
"/root/.pyenv/versions/rdb-pc-01/bin/python" -m pip install -U Red-DiscordBot

#Setup Redbot - skip if cloned and you followed the above steps
redbot-setup

#Name
rdbtw01

# Data locations
# Default: /root/.local/share/Red-DiscordBot/data/rdbtw01 (/root/.config/Red-DiscordBot)
/mnt/ssd1/rdb-tw-01/data/  

#data location
default (make note)

#storage backend
json

# start instance
redbot rdbtw01

#token - https://docs.discord.red/en/stable/bot_application_guide.html#creating-a-bot-account

# copy data across
## Cogs
## settings

# re-permission copied data
chown -R docker /mnt/ssd1/ && sudo chgrp -R docker /mnt/ssd1/

#re-add cog repos (manually :( )

#re-enable cogs and check are working

#set bot to autostart - https://docs.discord.red/en/stable/autostart_systemd.html
nano /etc/systemd/system/red@.service
systemctl start red@rdbtw01
systemctl enable red@rdbtw01


===================


Known Errors:

# [red] Bot doesn't have any owner set!
a) pass --team-members-are-owners when launching Red - in this case Red will treat all members of the bot application's team as owners
b) set owner manually with redbot --edit <instance_name>
c) pass owner ID(s) when launching Red with --owner (and --co-owner if you need more than one) flag

============
Description=%I rdbtw01
After=multi-user.target
After=network-online.target
Wants=network-online.target

[Service]
ExecStart=/root/.pyenv/versions/rdb-tw-01/bin/python -O -m redbot %I --no-prompt
User=root
Group=root
Type=idle
Restart=always
RestartSec=15
RestartPreventExitStatus=0
TimeoutStopSec=10

[Install]
WantedBy=multi-user.target
============




#Misc

from discord server

?backup

Red BOT
 — Today at 12:37 PM
1. Take note of the installed cogs and cog repositories with [p]cogs, then [p]load downloader, then [p]repo list.
2. Stop the bot, ideally with [p]shutdown.
3. Run redbot-setup backup <instancename> in your venv.
4. Copy the backup file to the new machine/location.
5. Extract the file to a location of your choice (remember the full path and make sure that the user you are going to install/run Red under can access this path).
6. Install Red as normal on the new machine/location.
7. Run redbot-setup to create a new instance, except use the path you remembered above as your data path.
8. Start your new instance.
9. Re-add the Repos using the same names as before.
10. Do [p]cog update
11. Re-add any cogs that were not re-installed (you may have to uninstall them first as Downloader may think they are still installed)
Note: The config (data) from cogs has been saved, but not the code itself.
