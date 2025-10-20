#!/usr/bin/env bash

# Directory containing your dotfiles (edit as needed)
# DOTFILES_DIR="$HOME/dotfiles"
DOTFILES_DIR="$FLAKE/dotfiles"
# List of dotfiles to symlink (edit as needed, include subpaths for files in subdirectories)
# FILES=".bashrc .vimrc .gitconfig .config/nvim/init.vim"
FILES="lib.nix"

install_symlinks() {
  for file in $FILES; do
    src="$DOTFILES_DIR/$file"
    dest="$HOME/$file"
    mkdir -p "$(dirname "$dest")"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
      echo "Backing up existing $dest to $dest.bak"
      mv "$dest" "$dest.bak"
    fi
    ln -s "$src" "$dest"
    echo "Symlinked $src -> $dest"
  done
}

uninstall_symlinks() {
  for file in $FILES; do
    dest="$HOME/$file"
    if [ -L "$dest" ]; then
      echo "Removing symlink $dest"
      rm "$dest"
      if [ -e "$dest.bak" ]; then
        echo "Restoring backup $dest.bak"
        mv "$dest.bak" "$dest"
      fi
    fi
  done
}

case "$1" in
  install)
    install_symlinks
    ;;
  uninstall)
    uninstall_symlinks
    ;;
  *)
    echo "Usage: $0 {install|uninstall}"
    exit 1
    ;;
esac
