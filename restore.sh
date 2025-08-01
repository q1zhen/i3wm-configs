#!/bin/bash

# This script restores configuration files from the 'config' directory to ~/.config

# Base directory for configs
base_config_dir="$HOME/.config"

# Check if the 'config' directory exists
if [ ! -d "config" ]; then
	echo "Error: 'config' directory not found. Nothing to restore." >&2
	exit 1
fi

# Iterate over all items in the 'config' directory
for item in config/*; do
	if [ -e "$item" ]; then
		item_name=$(basename "$item")
		target_path="$base_config_dir/$item_name"

		# If the target directory or file already exists, back it up
		if [ -e "$target_path" ]; then
			backup_path="$target_path.bak"
			if [ -e "$backup_path" ]; then
				rm -rf $backup_path
				echo "Purged existing backup $backup_path."
			fi
			echo "Backing up existing '$target_path' to '$backup_path'"
			mv "$target_path" "$backup_path"
		fi

		# Restore the configuration
		echo "Restoring '$item_name' to '$base_config_dir/'"
		cp -r "$item" "$base_config_dir/"
	fi
done

echo "Restore complete."
