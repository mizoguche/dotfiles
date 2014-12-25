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

echo 'install libraries for markdown html preview'
brew install nodejs
sudo gem install redcarpet pygments.rb
npm -g install instant-markdown-d

ln -Fis ~/Dropbox/neosnippet/ ~/neosnippet
