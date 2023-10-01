# Clone alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty

# Set up Terminfo
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

# Cleanup
cd ..
rm -rf alacritty

