apps=(
  alfred
  bartender
  bettertouchtool
  discord
  google-chrome
  iterm2
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

# Patched Font
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

