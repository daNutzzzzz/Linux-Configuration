#!/bin/bash

# Define available scripts
scripts=(
  "baseconfig.sh"
  "coretools.sh"
  "monitoring.sh"
  "Storage.sh"
  "nfs_server.sh"
  "samba_server.sh"
  "Exit"
)

# Display menu title
echo "** Server Setup Menu **"

# Loop through scripts and display options
ps3="Please enter your choice (1-$((${#scripts[@]} - 1)) or 'Exit'): "
select script in "${scripts[@]}"; do
  case $script in
    "baseconfig.sh")
      echo "Running BaseConfig.sh..."
      bash BaseConfig.sh  # Replace with actual execution command if needed
      break
      ;;
    "CoreTools.sh")
      echo "Running InstallCoreTools.sh..."
      bash coretools.sh
      break
      ;;
    "monitoring.sh")
      echo "Running Configure Monitoring.sh..."
      bash monitoring.sh  # Escape spaces in filenames
      break
      ;;
    "storage.sh")
      echo "Running SetupStorage.sh..."
      bash storage.sh
      break
      ;;
    "nfs_server.sh")
      echo "Running setup_nfs_server.sh..."
      bash nfs_server.sh
      break
      ;;
    "samba_server.sh")
      echo "Running setup_samba_server.sh..."
      bash samba_server.sh
      break
      ;;
    "Exit")
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac
done

echo "** Script execution completed. **"