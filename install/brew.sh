# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade

apps=(
  fzf
  git
  helm
  jq
  nvm
  neovim
  ripgrep
  tmux
  tree
  wget
  yarn
  z
)

brew install "${apps[@]}"
