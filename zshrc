# ZSH Config
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM_PLUGIN="$ZSH/custom/plugins"

export TERM="alacritty"

ZSH_THEME="simple"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  docker
  docker-compose
  kubectl
  zsh-autosuggestions
  zsh-vim-mode
)

# Path
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Exports
export EDITOR="nvim"
export DOTFILES="$HOME/projects/dotfiles"

# Aliases
source $HOME/.aliases

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

# Keybind tmuxer to C-f
bindkey -s ^F "tmuxer\n"

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
HISTSIZE=1000000
SAVEHIST=${HISTSIZE}

# z
. $(brew --prefix)/etc/profile.d/z.sh

# NVM Configuration
source $(brew --prefix nvm)/nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

