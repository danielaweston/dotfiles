# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade

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
)

brew install "${apps[@]}"
