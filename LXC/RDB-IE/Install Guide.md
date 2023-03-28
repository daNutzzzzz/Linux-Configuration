# Install Guide
https://docs.discord.red/en/stable/install_guides/ubuntu-non-lts.html

# Acces RBD IE Instance
pyenv shell rdb-ie-01

# start instanmce
redbot rdbie01

# Data locations
/root/.local/share/Red-DiscordBot/data/rdbie01 (/root/.config/Red-DiscordBot)
/mnt/ssd1/rdb-ie-01/data/  

# copy data across
## Cogs
## settings

# re-permission copied data
chown -R docker /mnt/ssd1/ && sudo chgrp -R docker /mnt/ssd1/

#re-add cog repos (manually :( )

#re-enable cogs and check are working

#set bot to autostart
https://docs.discord.red/en/stable/autostart_systemd.html

============
Description=%I rdbie01
After=multi-user.target
After=network-online.target
Wants=network-online.target

[Service]
ExecStart=/root/.pyenv/versions/rdb-ie-01/bin/python -O -m redbot %I --no-prompt
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
