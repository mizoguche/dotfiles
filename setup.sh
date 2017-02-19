#!/bin/sh

./Brewfile
./setup.copy.sh

echo 'vim setup'

echo 'vim backup directory'
mkdir -p ~/vimbackup

echo 'install colorschema'
ln -Fis $PWD/colors ~/.vim

# show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool YES
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.finder QLEnableTextSelection -bool true 

source ~/.zshrc
