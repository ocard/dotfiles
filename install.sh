#!/bin/sh

ln -sv ~/Dotfiles/.zshrc                            ~ 
ln -sv ~/Dotfiles/.tmux.conf                        ~

ln -sv ~/Dotfiles/bin                               ~
ln -sv ~/Dotfiles/powerline                         ~/.config
ln -sv ~/Dotfiles/global_gitignore                  ~/.config/git/ignore

# make a link to crontab file in this folder
ln -sv /etc/crontab                                 ~/Dotfiles


