#!/bin/bash

# Define available scripts
scripts=(
  "BaseConfig.sh"
  "Configure Monitoring.sh"
  "InstallCoreTools.sh"
  "SetupStorage.sh"
  "Exit"
)

# Display menu title
echo "** Server Setup Menu **"

# Loop through scripts and display options
ps3="Please enter your choice (1-$((${#scripts[@]} - 1)) or 'Exit'): "
select script in "${scripts[@]}"; do
  case $script in
    "BaseConfig.sh")
      echo "Running BaseConfig.sh..."
      bash BaseConfig.sh  # Replace with actual execution command if needed
      break
      ;;
    "Configure Monitoring.sh")
      echo "Running Configure Monitoring.sh..."
      bash Configure_Monitoring.sh  # Escape spaces in filenames
      break
      ;;
    "InstallCoreTools.sh")
      echo "Running InstallCoreTools.sh..."
      bash InstallCoreTools.sh
      break
      ;;
    "SetupStorage.sh")
      echo "Running SetupStorage.sh..."
      bash SetupStorage.sh
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