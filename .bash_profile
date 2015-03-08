# \u is username
export PS1="\u: $ "              # bash prompt
#export PS1='Bilalh$(__git_ps1 "@%s") \$ '  # Shows Git branch
#export GIT_PS1_SHOWDIRTYSTATE=true
#export GIT_PS1_SHOWUNTRACKEDFILES=true
#export GIT_PS1_SHOWSTASHSTATE=true

export LC_CTYPE=en_GB.UTF-8;
export LANG=en_GB.UTF-8


# bilalh@8afbf821: [develop]      full colour + commit id + branch
#export PS1='\[$(tput setaf 3)\]\u@\h:\[$(tput sgr0)$(tput setaf 5)\]\[$(tput sgr0)$(tput setaf 2)\] $(__git_ps1 "[%s]") \[$(tput sgr0)\]$ '
### History Settings
export HISTFILESIZE=15000    # the bash history should save 15000 commands
export HISTCONTROL=erasedups # remove duplicate from history

# don't store history entries that match this pattern
declare -x HISTIGNORE='cs:jr*:gitx:hista:aes*:srm*: *'

alias hist='history | less '

#allow colour in less
export LESS='-R'

### Bash options
shopt -s histappend          # all sessions are saved
shopt -s cdspell             # fix minor error in cd paths
shopt -s histreedit          # allows re-edit on C-R
export EDITOR='vim'          # default editor

# Ignores files in tab completion
export FIGNORE=$FIGNORE:.o:.out:.pyc:.pdfsync:.log:.bbl:.aux:.blg:.out:.toc:

# Colorize the prompt and commands such as ls
export CLICOLOR=1

# light colours
#export LSCOLORS=ExFxCxDxbxegedabagacad

# dark colours
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;33;246m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline]

# Completion for git + others
[ -d /usr/local/etc/bash_completion.d/ ] &&  for i in /usr/local/etc/bash_completion.d/*; do source $i; done

# bashmarks
export BASHMARKS_k=true
export BASHMARKS_ITERM_SESSION="B ZSH"
[ -f  ~/Projects/_forks/bashmarks/bashmarks.sh ]  && source ~/Projects/_forks/bashmarks/bashmarks.sh

if [ -f ~/CS/instancegen/scripts/misc/convenience.sh ]; then
    source ~/CS/instancegen/scripts/misc/convenience.sh
fi

source ~/.settings/paths.sh

### aliases and other functions
[ -f ~/.bashrc ] && source ~/.bashrc

