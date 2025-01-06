# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade

brew_install() {
  echo "\nInstalling $1"

  if brew list $1 &>/dev/null; then
    echo "$1 is already installed"
  else
    brew install $1 && echo "$1 installed"
  fi
}

apps=(
  fzf
  gh
  git
  jq
  nvm
  neovim
  ripgrep
  tmux
  tree

  # Languages
  typescript
  go
  terraform

  # Devops Tools
  docker
  docker-compose
  kubectl
  helm

  # Applications
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

for i in "${apps[@]}"
do
 brew_install $i
done
