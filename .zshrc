export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#export ZSH_THEME=avery


export ZSH_THEME="powerline"
export POWERLINE_RIGHT_A="exit-code"
export POWERLINE_HIDE_USER_NAME="true"
export POWERLINE_HIDE_HOST_NAME="true"
export POWERLINE_DISABLE_RPROMPT="true"
export POWERLINE_RIGHT_B=""
export POWERLINE_RIGHT_A=""


export DEFAULT_USER=Bilalh

plugins=(funcs todo)
plugins+=(osx ruby autojump encode64 gem git-extras pip battery brew pygmentize python       zsh-syntax-highlighting history-substring-search )

DISABLE_CORRECTION=true
source $ZSH/oh-my-zsh.sh

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=40000
setopt APPEND_HISTORY           # append rather than overwrite history file.
setopt EXTENDED_HISTORY         # save timestamp and runtime information
setopt HIST_EXPIRE_DUPS_FIRST   # allow dups, but expire old ones when I hit HISTSIZE
setopt HIST_FIND_NO_DUPS        # don't find duplicates in history
setopt HIST_IGNORE_ALL_DUPS     # ignore duplicate commands regardless of commands in between
setopt HIST_IGNORE_DUPS         # ignore duplicate commands
setopt HIST_REDUCE_BLANKS       # leave blanks out
setopt HIST_SAVE_NO_DUPS        # don't save duplicates
setopt INC_APPEND_HISTORY       # write after each command
setopt SHARE_HISTORY            # share history between sessions
setopt HIST_IGNORE_SPACE        # Don't save command starting with a space
unsetopt cdablevars

export EDITOR='vim'          # default editor 
export LESS='-R'
export FIGNORE=$FIGNORE:.o:.out:.pyc:.pdfsync:.log:.bbl:.aux:.blg:.out:.toc:
export CLICOLOR=1

#
# light colours
#export LSCOLORS=ExFxCxDxbxegedabagacad
# dark colours
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Path settings(bin before current $PATH to override default version)
PATH=$HOME/bin:$HOME/bin/haskell_stuff:/usr/local/bin:$PATH
PATH=$PATH:/usr/local/sbin:$HOME/bin/mplayer_osx
PATH=$HOME/Library/Haskell/bin:$HOME/.cabal/bin:$PATH


PATH=$PATH:/Users/bilalh/Projects/Shell-Tunes/extra
PATH=$PATH:~/.rvm/gems/ruby-1.9.3-p286/bin
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.3/bin
#PATH=$PATH:$HOME/Programming/Java/android-sdk-mac_x86/platform-tools


#cs PATH
#PATH=$PATH:/Users/bilalh/CS/conjure/scripts/other
[ -d ~/.pscripts/  ] && PATH=$PATH:~/.pscripts
[ -d ~/.Utilities/ ] && for i in ~/.Utilities/*; do PATH=$PATH:$i; done
PATH=$PATH:/Users/bilalh/CS/minion-build
PATH=$PATH:/Users/bilalh/CS/savilerow
PATH=$PATH:/Users/bilalh/CS/conjure/test/solving
PATH=$PATH:/Users/bilalh/CS/conjure/scripts/other
export PATH

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
#export ANDROID_SDK=$HOME/Programming/Java/android-sdk-mac_x86
export RUBY_PLATFORM="darwin"
export R_HOME=/Library/Frameworks/R.framework/Resources

export CONJURE_REPO="~/CS/conjure"


#Adds all files in .bash at lanuch
[ -d ~/.bash/ ] &&  for i in ~/.bash/*.sh; do source $i; done

[ -d ~/.pbash/ ] &&  for i in ~/.pbash/*.sh; do source $i; done

PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

#Alias and functions
alias tl='todo list'

function t(){
    todo ${@:-list}
}

alias f='dirs -v'
#Autoload
autoload -U zcalc
[ -f  ~/.local/bin/bashmarks.sh ]  && source ~/.local/bin/bashmarks.sh 

#Bindings
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey '^[s' insert-sudo

# Skip forward/back a word with opt-arrow
bindkey 'D' backward-word
bindkey 'C' forward-word

bindkey 'OD' beginning-of-line
bindkey 'OC' end-of-line

# for trying # 
bindkey -s '^[3' \#
bindkey -s '£' \#


# man pages  IN COLOUR!
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;33;246m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline]


ZSH_HIGHLIGHT_STYLES[path]='none'
