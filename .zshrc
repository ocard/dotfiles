# export ZSH_TMUX_AUTOSTART=true

[ -f ~/.profile ] && source ~/.profile
[ -f ~/.api_keys ] && source ~/.api_keys

# Path to your oh-my-zsh installation.
  export ZSH="/home/oc/.oh-my-zsh"

  export TERM='st-256color'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git command-not-found colored-man-pages z tmux 
  you-should-use fast-syntax-highlighting q expand-ealias auto-ls
  zsh-fzy
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable_joined vcs)
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="16"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER="⇃"
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD=true
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_ETC_ICON=''
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\Ue0c6'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\Ue0c7'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root)

AUTO_LS_COMMANDS=('/usr/bin/clear' ls '[[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]] && /usr/bin/git status -s')
auto-ls-ls () {
  print -P $PS1
  ls -N --group-directories-first --color
}

# you-should-use alias reminder message 
export YSU_MESSAGE_FORMAT="$(tput setaf 1)$(tput smul)%alias_type for %command$(tput rmul): $(tput setaf 9)$(tput bold)%alias$(tput sgr0)"
# you-should-use alias enforcement
export YSU_HARDCORE=0 # 1: enable; 0: disable

typeset -aU path
## added by Anaconda3 installer
# export PATH="~/anaconda3/bin:$PATH"
# export PATH="~/bin:$PATH"
path=(~/bin ~/anaconda3/bin $path)
export PYTHONPATH=~/bin
export PATH
export EDITOR='code'


# starts one or multiple args as programs in background
background() {
  for ((i=2;i<=$#;i++)); do
    ${@[1]} ${@[$i]} &> /dev/null &
  done
}
# qfind - used to quickly find files that contain a string in a directory
qfind () {
    find . -exec grep -l $1 {} \;
    return 0
}

alias wtr="curl -s wttr.in | less"
alias prettyjson='python -m json.tool'
alias ls='ls -N --group-directories-first --color'
alias l='ls++ --potsf'
alias la='ls++ --potsf -A'
alias lt='ls++ --potsf -Atr'
ealias lss='la -Sr'
[ ! -f $HOME/.dircolors ] && wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
eval $(dircolors -b $HOME/.dircolors)
ds() {
  if [ -z "$1" ]; then
    du -shc --time -- * | sort -hr
  else
    du -shc --time -- ./$1/* | sort -hr
  fi
}
dsc() {
  if [ -z "$1" ]; then
    du -shc --time --exclude="*.jp*" --exclude="*.mp4" -- * | sort -hr
  else
    du -shc --time --exclude="*.jp*" --exclude="*.mp4" -- ./$1/* | sort -hr
  fi
}

alias cmatrix='cmatrix -ab -u 7'

ealias ai="sudo apt install"
ealias ar="sudo apt remove"
ealias ash="apt show"
ealias as="apt search"

ealias qq="tail -100f -- /tmp/q"
ealias qqrm="rm /tmp/q"

qc(){
  while getopts "h" opt
  do
      case $opt in
      (h) echo "runs: git add . && git commit -m [MESSAGE] && git push origin master" ; return 0 ;;
      (*) printf "Illegal option '-%s'\n" "$opt" && exit 1 ;;
      esac
  done
  git add . && git commit -m "$1" && git push origin master
}

ealias cat="bat"
alias bat="bat --terminal-width=-2 --italic-text always"
export BAT_PAGER="less -RFS"
alias -g L='| bat'
alias -g G='| grep'
alias -g C='| xclip -selection clipboard'

# open json with fx 
# (it just does what (fx $1) would do if it worked on my machine)
fxopen() {
  file=$1
  shift
  cat $file | fx $@
}
alias -s {html,cpp,c,xml,py,conf,desktop,txt,code-workspace}='code'
alias -s json='fxopen'
alias -s log='tail'
alias -s {pdf,PDF,jpg,JPG,png,PNG}='background xdg-open'
alias -s {zip,rar}='background xdg-open'
alias -s {mp4,MP4,webm}='background xdg-open'

# make a backup of a file
# https://github.com/grml/grml-etc-core/blob/master/etc/zsh/zshrc
bk() {
	cp -a "$1" "${1}_$(date --iso-8601=seconds)"
}
# launch an app (https://github.com/jleclanche/dotfiles/blob/master/.zshrc)
function launch {
	type $1 >/dev/null || { print "$1 not found" && return 1 }
	$@ &>/dev/null &|
}
alias launch="launch " # expand aliases
# https://stackoverflow.com/questions/6250698/how-to-decode-url-encoded-string-in-shell
# Encode with URLEncode
function urlencode {
	python -c "import sys; from urllib.parse import quote_plus; print(quote_plus(sys.stdin.read()))"
}
# Decode URLencoded string
function urldecode {
	python -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()), end='')"
}
# transfer.sh alias
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 
# print a rain forecast digest to stdout
alias rain="python ~/bin/weather_alert.py"

# ESC-C: cd into the selected directory
# CTRL-T: Place the selected file path in the command line
# CTRL-R: Place the selected command from history in the command line
# CTRL-P: Place the selected process ID in the command line
bindkey '\ec' fzy-cd-widget
bindkey '^T'  fzy-file-widget
bindkey '^R'  fzy-history-widget
bindkey '^P'  fzy-proc-widget
