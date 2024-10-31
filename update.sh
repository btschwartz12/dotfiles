#!/bin/bash

# List of dotfiles to copy from home directory to repository
dotfiles=(
    "$HOME/.zshrc"
    "$HOME/.tmux.conf"
    "$HOME/.tmux.conf.local"
    "$HOME/.config/nvim"
    "$HOME/lib/data/functions.sh"
    "$HOME/lib/data/ghrc"
)

# Get the directory where this script is located (assumed to be the dotfiles repo)
DOTFILES_REPO="$(cd "$(dirname "$0")"; pwd)"

for file in "${dotfiles[@]}"; do
    if [ -e "$file" ]; then
        # Remove leading home directory path
        relative_path="${file#$HOME/}"
        dest_dir="$DOTFILES_REPO/$(dirname "$relative_path")"
        mkdir -p "$dest_dir"
        cp -r "$file" "$dest_dir"
        echo "Copied $file to $dest_dir"
    else
        echo "Warning: $file does not exist"
    fi
done

