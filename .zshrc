export ZSH=$HOME/.oh-my-zsh

export DEFAULT_USER=Bilalh
setopt interactivecomments

plugins=(funcs todo)
plugins+=(
         osx ruby autojump encode64 gem git-extras
         pip battery brew pygmentize python vagrant
         #auto-fu
         history-substring-search 
         zsh-git-escape-magic
         anaconda forklift gnu-utils
         )

ANACONDA=~/.local/anaconda/

DISABLE_CORRECTION=true
ZSH_THEME="pure"
source $ZSH/oh-my-zsh.sh

fpath+=~/.oh-my-zsh/fpath
autoload -Uz git-escape-magic
git-escape-magic
zstyle '*' single-ignored complete
unsetopt menu_complete

export BASHMARKS_NO_PWD=True
#export PROMPT='[%28<...<%4(~:...:)%3~/] %# '

# History
HISTFILE=${HISTFILE:-$HOME/.zsh_history}
HISTSIZE=50000
SAVEHIST=10000
setopt APPEND_HISTORY           # append rather than overwrite history file.
setopt EXTENDED_HISTORY         # save timestamp and runtime information
setopt HIST_EXPIRE_DUPS_FIRST   # allow dups, but expire old ones when I hit HISTSIZE
setopt HIST_FIND_NO_DUPS        # don't find duplicates in history
setopt HIST_IGNORE_ALL_DUPS     # ignore duplicate commands regardless of commands in between
setopt HIST_IGNORE_DUPS         # ignore duplicate commands

setopt HIST_IGNORE_SPACE        # Don't save command starting with a space
setopt HIST_REDUCE_BLANKS       # leave blanks out
setopt HIST_SAVE_NO_DUPS        # don't save duplicates
setopt INC_APPEND_HISTORY       # write after each command
setopt SHARE_HISTORY            # share history between sessions

#setopt null_glob                # Allow null globs 
setopt nonullglob
setopt RM_STAR_WAIT             #  first wait ten seconds when doing rm *
unsetopt cdablevars

export EDITOR='vim'          # default editor 
export LESS='-R'             # Less colour 
export FIGNORE=$FIGNORE:.o:.out:.pyc:.pdfsync:.log:.bbl:.aux:.blg:.out:.toc:



# light colours
#export LSCOLORS=ExFxCxDxbxegedabagacad

# dark colours
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


source ~/.settings/paths.sh

#Adds all files in .bash at lanuch
[ -d ~/.bash/ ] &&  for i in ~/.bash/*.sh; do source $i; done

[ -d ~/.pbash/ ] &&  for i in ~/.pbash/*.sh; do source $i; done
#
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
autoload bashcompinit
bashcompinit

[ -d ~/.bash/_completion ] &&  for i in ~/.bash/_completion/*; do source $i; done


export BASHMARKS_k=true
export BASHMARKS_ITERM_SESSION="B ZSH"
[ -f  ~/Projects/_forks/bashmarks/bashmarks.sh ]  && source ~/Projects/_forks/bashmarks/bashmarks.sh 

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


tcsh-backward-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-word
}
zle -N tcsh-backward-word

tcsh-forward-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle forward-word
}
zle -N tcsh-forward-word

bindkey "^[b" tcsh-backward-word
bindkey "^[f" tcsh-forward-word

tcsh-backward-delete-word () {
  local WORDCHARS="${WORDCHARS:s#/#}"
  zle backward-delete-word
}
zle -N tcsh-backward-delete-word
bindkey "^W" tcsh-backward-delete-word

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


#ZSH_HIGHLIGHT_STYLES[path]='none'


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

#vim tags completion for vim -t <tag>
function _get_tags {
  [ -f ./tags ] || return
  local cur
  read -l cur
  echo $(echo $(awk -v ORS=" "  "/^${cur}/ { print \$1 }" tags))
}
compctl -x 'C[-1,-t]' -K _get_tags -- vim
autoload -U compinit && compinit -u

if [ -f ~/CS/instancegen/scripts/misc/convenience.sh ]; then
    source ~/CS/instancegen/scripts/misc/convenience.sh 
fi

hr(){printf '=%.0s' $(seq $COLUMNS)}

function exportf (){
    export $(echo $1)="`whence -f $1 | sed -e "s/$1 //" `"
}


function gt(){
osascript -e '#!/usr/bin/env osascript' \
    -e 'tell application "TextMate"' \
    -e 'set p to path of document 1'\
    -e 'end tell'
}

