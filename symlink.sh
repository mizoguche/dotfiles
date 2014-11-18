#!/bin/sh
cd $(dirname $0)
for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

# vim backup directory
mkdir -p ~/vimbackup

# install NeoBundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# install colorschema
ln -Fis $PWD/colors ~/.vim

ln -Fis ~/Dropbox/neosnippet/ ~/neosnippet
