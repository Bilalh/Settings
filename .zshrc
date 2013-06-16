export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#export ZSH_THEME=avery


#export ZSH_THEME="powerline"
#export POWERLINE_RIGHT_A="exit-code"
#export POWERLINE_HIDE_USER_NAME="true"
#export POWERLINE_HIDE_HOST_NAME="true"
#export POWERLINE_DISABLE_RPROMPT="true"
#export POWERLINE_RIGHT_B=""
#export POWERLINE_RIGHT_A=""


export DEFAULT_USER=Bilalh

plugins=(funcs todo)
plugins+=(osx ruby autojump encode64 gem git-extras 
          pip battery brew pygmentize python 
          zsh-syntax-highlighting history-substring-search )

DISABLE_CORRECTION=true
source $ZSH/oh-my-zsh.sh

zstyle '*' single-ignored complete
#setopt menu_complete

export PROMPT='[%28<...<%4(~:...:)%3~/] %# '

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
export LESS='-R'             # Less colour 
export FIGNORE=$FIGNORE:.o:.out:.pyc:.pdfsync:.log:.bbl:.aux:.blg:.out:.toc:

export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'

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
    todo ${@:-pv}
}

alias f='dirs -v'
#Autoload
autoload -U zcalc
autoload -U zmv
autoload -U zrecompile
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

bindkey '' backward-kill-line

# for trying # 
bindkey -s '^[3' \#
bindkey -s '£' \#

# Press C-x a  to ++ the the last number in the command (e.g for playing videos)
_increase_number() {
  local -a match mbegin mend
  [[ $LBUFFER =~ '([0-9]+)[^0-9]*$' ]] &&
    LBUFFER[mbegin,mend]=$(printf %0${#match[1]}d $((10#$match+${NUMERIC:-1})))
}
zle -N increase-number _increase_number
bindkey '^Xa' increase-number
bindkey -s '^Xx' '^[-^Xa'

#recursive C-R  -- http://chneukirchen.org/blog/archive/2013/03/10-fresh-zsh-tricks-you-may-not-know.html
autoload -Uz narrow-to-region
function _history-incremental-preserving-pattern-search-backward
{
  local state
  MARK=CURSOR  # magick, else multiple ^R don't work
  narrow-to-region -p "$LBUFFER${BUFFER:+>>}" -P "${BUFFER:+<<}$RBUFFER" -S state
  zle end-of-history
  zle history-incremental-pattern-search-backward
  narrow-to-region -R state
}
zle -N _history-incremental-preserving-pattern-search-backward
bindkey "^R" _history-incremental-preserving-pattern-search-backward
bindkey -M isearch "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# find zsh info
function zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}

# Force file name completion on C-x TAB, Shift-TAB.
zle -C complete-files complete-word _generic
zstyle ':completion:complete-files:*' completer _files
bindkey "^X^I" complete-files

# man pages  IN COLOUR!
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;33;246m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline]


ZSH_HIGHLIGHT_STYLES[path]='none'


function avgBitRate(){
    parallel 'afinfo {} | grep "bit rate" ' ::: **/*.(mp3|m4a) |awk '\
    {sum+=$3; if(min==""){min=max=$3}; if($3>max) {max=$3} else if($3< min) {min=$3};  \
        if($3>325000){lossless++} else if($3>256000){n320++} else if($3>192000){n256++} else if($3 >160000){n192++} else if($3 > 128000){n160++} else{nless++ }  }\
    END {printf "    Total: %d\n Bitrates: \033[0m\033[32mAverage\033[0m %.0f kbps  \033[0m\033[32mMax\033[0m %0.f kbps  \033[0m\033[32mMin\033[0m %0.f kbps\
    Types: 320+: %d 320: %d 256: %d 192: %d 160: %d 160-: %d \n",\
        NR, sum/NR/1000,max/1000, min/1000,\
        lossless, n320, n256, n192, n160, nless\
    }' 
}
