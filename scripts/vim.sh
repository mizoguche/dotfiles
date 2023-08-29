#!/bin/sh -eux

echo 'setup vim'

# Install dein.vim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"

echo 'create vim backup directory'
mkdir -p ~/vimbackup

echo 'install colorschema'
ln -Fis $PWD/colors ~/.vim
