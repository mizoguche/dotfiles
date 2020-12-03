#!/bin/sh -eux

echo 'setup vim'

# Install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein
rm ./installer.sh

echo 'create vim backup directory'
mkdir -p ~/vimbackup

echo 'install colorschema'
ln -Fis $PWD/colors ~/.vim
