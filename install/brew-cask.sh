# Patched Font
brew tap homebrew/cask-fonts

apps=(
  alacritty
  aldente
  alfred
  bartender
  bettertouchtool
  discord
  font-hack-nerd-font
  google-chrome
  numi
  obsidian
  rectangle
  spotify
  stats
  the-unarchiver
  ticktick
  topnotch
)

brew install "${apps[@]}" --cask

