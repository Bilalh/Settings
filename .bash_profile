# \u is username
#export PS1="\u: $ "              # bash prompt
export PS1='Bilalh$(__git_ps1 "@%s") \$ '  # Shows Git branch
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

# bilalh@8afbf821: [develop]      full colour + commit id + branch
#export PS1='\[$(tput setaf 3)\]\u@\h:\[$(tput sgr0)$(tput setaf 5)\]\[$(tput sgr0)$(tput setaf 2)\] $(__git_ps1 "[%s]") \[$(tput sgr0)\]$ '
### History Settings
export HISTFILESIZE=10000    # the bash history should save 10000 commands
export HISTCONTROL=erasedups # remove duplicate from history

# don't store history entries that match this pattern  
declare -x HISTIGNORE='op:mlgw:cs:mll:ax:jr*:gitx:hista:mlwg:aes*:hda:on:mdb:histm:srm*: *'

alias h='history | grep '
alias hist='history | less '


### Bash options 
shopt -s histappend          # all sessions are saved 
shopt -s cdspell             # fix minor error in cd paths
shopt -s histreedit          # allows re-edit on C-R
export EDITOR='vim'          # default editor 

# Ignores files in tab completion
export FIGNORE=$FIGNORE:.o:.out:.pyc:.pdfsync:.log:.bbl:.aux:.blg:.out:.toc:

# Colorize the prompt and commands such as ls
export CLICOLOR=1
export LSCOLORS=ExFxCxDxbxegedabagacad

# Completion for git
[ -f ~/.completion/git-completion.bash ] && source ~/.completion/git-completion.bash 
[ -f  ~/.local/bin/bashmarks.sh ]        && source ~/.local/bin/bashmarks.sh 

### Path Settings 
# Path settings(bin before current $PATH to override default version)
PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$PATH:/usr/local/sbin:$HOME/bin/mplayer_osx

# Scripts 
[ -d ~/.pscripts/  ] && PATH=$PATH:~/.pscripts/
[ -d ~/.Utilities/ ] && for i in ~/.Utilities/*; do PATH=$PATH:$i; done
PATH=$PATH:/Users/bilalh/Programming/Projects/Shell-Tunes/extra
export PATH

### aliases and other functions
[ -f ~/.bashrc ] && source ~/.bashrc


