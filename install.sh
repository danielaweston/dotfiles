#!/bin/bash

# Set envvar for dotfiles dir
export DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlink dotfiles
. "$DOTFILES/install/symlink.sh"

# Package managers and packages
. "$DOTFILES/install/brew.sh"
. "$DOTFILES/install/zsh.sh"
. "$DOTFILES/install/alacritty.sh"

