# ZSH Config
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM_PLUGIN="$ZSH/custom/plugins"

ZSH_THEME="simple"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  docker
  docker-compose
  kubectl
  zsh-autosuggestions
  zsh-system-clipboard
  zsh-vim-mode
)

# Path
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Exports
export EDITOR="nvim"
export DOTFILES="$HOME/projects/dotfiles"
export TERM="alacritty"

# Aliases
source $HOME/.aliases

# Keybind tmuxer to C-f
bindkey -s ^F "tmuxer\n"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#626262,bold"

# zsh-vim-mode
VI_MODE_SET_CURSOR=true
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
MODE_CURSOR_VIINS="blinking bar"
KEYTIMEOUT=15

# Escape insert mode with "jk"
bindkey -M viins "jk" vi-cmd-mode

# Insert mode keybinds
bindkey ^Y autosuggest-accept
bindkey ^P history-beginning-search-backward
bindkey ^N history-beginning-search-forward

# Normal mode keybinds
bindkey -M vicmd ^Y autosuggest-accept
bindkey -M vicmd ^P history-beginning-search-backward
bindkey -M vicmd ^N history-beginning-search-forward

# History options
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

HISTFILE="${HOME}/.zsh_history"
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=999999999
SAVEHIST=999999999
HISTFILESIZE=100000000

# fzf
source <(fzf --zsh)

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# pnpm
export PNPM_HOME="/Users/dweston/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

autoload -U compinit; compinit
