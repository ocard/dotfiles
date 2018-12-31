#!/bin/sh

## shamelessly stolen from https://github.com/LukeSmithxyz/LARBS/blob/master/larbs.sh
gitmakeinstall() {
	dir=$(mktemp -d)
	git clone --depth 1 "$1" "$dir" &>/dev/null
	cd "$dir" || exit
    case "$1" in
	    "https://github.com/trapd00r/ls--.git")     
            cpan Term::ExtendedColor ;
            perl Makefile.PL ;
            ;;
        *)
            ;;
	esac
	make &>/dev/null
	make install &>/dev/null
    case "$1" in
	    "https://github.com/trapd00r/ls--.git")     
            cp ls++.conf $HOME/.ls++.conf ;
            ;;
        *)
            ;;
	esac
	cd /tmp || return ;}


gitmakeinstall(https://github.com/ocard/st)
gitmakeinstall(https://github.com/ocard/yeahconsole)
gitmakeinstall(https://github.com/trapd00r/ls--.git)

ln -sv ~/Dotfiles/.zshrc                            ~ 
ln -sv ~/Dotfiles/.tmux.conf                        ~

ln -sv ~/Dotfiles/bin                               ~
ln -sv ~/Dotfiles/powerline                         ~/.config
ln -sv ~/Dotfiles/global_gitignore                  ~/.config/git/ignore

# make a link to crontab file in this folder
ln -sv /etc/crontab                                 ~/Dotfiles