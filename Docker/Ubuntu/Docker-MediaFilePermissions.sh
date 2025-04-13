#mkdir /mnt/data
#chown nfs:nfs /mnt/data
#chmod 777 /mnt/data

sudo mkdir -p /mnt/data
sudo mkdir -p /mnt/data/Multimedia
sudo mkdir -p /mnt/data/Multimedia/Movies
sudo mkdir -p "/mnt/data/Multimedia/TV Shows"
sudo mkdir -p /mnt/data/Multimedia/Music

sudo chown 1000:1000 /mnt/data
sudo chmod 777 /mnt/data
sudo chmod 775 /mnt/data/Multimedia
sudo chmod 755 /mnt/data/Multimedia/Movies
sudo chmod 755 "/mnt/data/Multimedia/TV Shows"
sudo chmod 755 /mnt/data/Multimedia/Music


# Root Folder
rwxrwxrwx
777

# Root Multimedia 
rwxrwxr-x
775

# Movies/TV Shows/Music Folders
rwxr-xr-x
755

# Media Files
rw-rw-r--
664