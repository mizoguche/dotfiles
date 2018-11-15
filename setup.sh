#!/bin/sh

./Brewfile
./setup.copy.sh

echo 'vim setup'

# Install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein

echo 'vim backup directory'
mkdir -p ~/vimbackup

echo 'install colorschema'
ln -Fis $PWD/colors ~/.vim

# show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool YES
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.finder QLEnableTextSelection -bool true 

source ~/.zshrc
