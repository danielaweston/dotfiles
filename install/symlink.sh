rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config/nvim
ln -snf $DOTFILES/nvim/* $HOME/.config/nvim

rm -rf $HOME/.local/bin
mkdir -p $HOME/.local/bin
ln -snf $DOTFILES/scripts/* $HOME/.local/bin

ln -sf $DOTFILES/alacritty.yml $HOME/.alacritty.yml
ln -sf $DOTFILES/zshrc $HOME/.zshrc
ln -sf $DOTFILES/aliases $HOME/.aliases
ln -sf $DOTFILES/tmux.conf $HOME/.tmux.conf
ln -sf $DOTFILES/vimrc $HOME/.vimrc

