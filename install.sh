#!/bin/bash

# List of dotfiles to copy from repository to home directory
dotfiles=(
    ".zshrc"
    ".tmux.conf"
    ".tmux.conf.local"
    ".config/nvim"
    "lib/data/functions.sh"
    "lib/data/ghrc"
)

# Get the directory where this script is located (assumed to be the dotfiles repo)
DOTFILES_REPO="$(cd "$(dirname "$0")"; pwd)"

# Backup directory with timestamp
BACKUP_DIR="$HOME/dotfiles_latest_backup"
mkdir -p "$BACKUP_DIR"

for file in "${dotfiles[@]}"; do
    src="$DOTFILES_REPO/$file"
    dest="$HOME/$file"

    if [ -e "$dest" ]; then
        # Backup existing file or directory
        backup_dest="$BACKUP_DIR/$file"
        mkdir -p "$(dirname "$backup_dest")"

        # Remove any existing files or directories in the backup location
        rm -rf "$backup_dest"

        mv "$dest" "$backup_dest"
        echo "Backed up $dest to $backup_dest"
    fi

    if [ -e "$src" ]; then
        # Copy file or directory from repository to home directory
        mkdir -p "$(dirname "$dest")"
        cp -r "$src" "$dest"
        echo "Installed $src to $dest"
    else
        echo "Warning: $src does not exist in the repository"
    fi
done

