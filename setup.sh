#!/bin/sh

echo 'create symbolic link of dotfiles'

cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

echo 'install antigen'
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/antigen ~/.zsh/antigen

echo 'vim setup'

echo 'vim backup directory'
mkdir -p ~/vimbackup

echo 'install NeoBundle'
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

echo 'install colorschema'
ln -Fis $PWD/colors ~/.vim

ln -Fis ~/Dropbox/neosnippet/ ~/neosnippet

# show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool YES
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

source ~/.zshrc
