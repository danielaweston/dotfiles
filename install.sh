#!/bin/bash

# Set envvar for dotfiles dir
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlink dotfiles
. "$DOTFILES_DIR/install/symlink.sh"

# Package managers and packages
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/zsh.sh"
. "$DOTFILES_DIR/install/nvim.sh"

# MacOS applications
if [[ $OSTYPE == 'darwin'* ]]; then
  . "$DOTFILES_DIR/install/brew-cask.sh"
fi

