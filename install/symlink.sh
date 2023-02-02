rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config/nvim
ln -snf $DOTFILES_DIR/nvim/* $HOME/.config/nvim

rm -rf $HOME/.local/bin
mkdir -p $HOME/.local/bin
ln -snf $DOTFILES_DIR/scripts/* $HOME/.local/bin

ln -sf $DOTFILES_DIR/zshrc $HOME/.zshrc
ln -sf $DOTFILES_DIR/p10k.zsh $HOME/.p10k.zsh
ln -sf $DOTFILES_DIR/aliases $HOME/.aliases
ln -sf $DOTFILES_DIR/tmux.conf $HOME/.tmux.conf
ln -sf $DOTFILES_DIR/vimrc $HOME/.vimrc

