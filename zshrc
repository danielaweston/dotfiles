# Path
export PATH="/opt/homebrew/bin:$PATH"

# Editor
export EDITOR="nvim"

# Aliases
source $HOME/.aliases

# Tmux session selector
bindkey -s ^f "$HOME/.local/bin/tmuxer\n"

# ZSH Config
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM_PLUGIN="$ZSH/custom/plugins"

ZSH_THEME="simple"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  kubectl
  zsh-autosuggestions
  zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions
source $ZSH_CUSTOM_PLUGIN/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60,bg=bold,underline'

# zsh-history-substring-search
source $ZSH_CUSTOM_PLUGIN/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=1'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=10'

# z
. $(brew --prefix)/etc/profile.d/z.sh

# NVM Configuration
source $(brew --prefix nvm)/nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

