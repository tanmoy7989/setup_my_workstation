# default stuff
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## color support
export TERM=xterm-256color
export PS1="\[\e[36;1m\]\@ \[\e[33;1m\]\h\[\e[32;1m\]\w> \[\e[0m\]" # color prompt and titlebar
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32' # color searches

# color man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# bash history
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000000
HISTFILESIZE=2000000
shopt -s histappend
export HISTTIMEFORMAT="%F %T "

# Apple doesnt allow dircolor variables so this workaround
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# get rid of those pesky .DS_Store files        
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# file extraction
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# aliases
alias ls='ls -ohFrt'
alias rm='rm -i'
alias bashedit='vim $HOME/.bashrc'
alias vimedit='vim $HOME/.vimrc'

