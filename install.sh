#!/bin/sh

ln -sv ~/Dotfiles/.api_keys ~
ln -sv ~/Dotfiles/.zshrc ~ 
ln -sv ~/Dotfiles/.tmux.conf ~

ln -sv ~/Dotfiles/bin ~
ln -sv ~/Dotfiles/powerline ~/.config

# make a link to crontab file in this folder
ln -sv /etc/crontab ~/Dotfiles


