# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade

apps=(
  fzf
  git
  jq
  nvm
  neovim
  ripgrep
  tmux
  z

  # Devops Tools
  docker
  docker-compose
  colima
  kubectl
  helm
)

brew install "${apps[@]}"
