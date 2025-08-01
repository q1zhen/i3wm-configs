#!/bin/bash

# List of directories to back up from ~/.config
# Add any other directories you want to back up here (e.g., "polybar", "rofi")
config_dirs=("i3" "i3blocks")

# Create a backup of the old config directory
if [ -d "config" ]; then
	echo "Backing up existing 'config' directory to 'config.old'"
	mv config config.old
fi

# Create a new config directory
mkdir -p config
echo "Created 'config' directory."

# Base directory for configs
base_config_dir="$HOME/.config"

# Copy specified config directories
for dir in "${config_dirs[@]}"; do
	if [ -d "$base_config_dir/$dir" ]; then
		echo "Copying '$base_config_dir/$dir' to 'config/'"
		cp -r "$base_config_dir/$dir" config/
	else
		echo "Warning: Directory '$base_config_dir/$dir' not found. Skipping."
	fi
done

# Remove the old config directory if it exists
if [ -d "config.old" ]; then
	echo "Removing old backup 'config.old'"
	rm -rf config.old
fi

echo "Fetch complete."
