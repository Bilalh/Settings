
[ -f ~/.bashrc ] && source ~/.bashrc

export PS1="Bilalh: $ "      # bash prompt

export HISTFILESIZE=10000    # the bash history should save 10000 commands
export HISTCONTROL=erasedups # remove duplicate from history

# don't store history entries that match this pattern
declare -x HISTIGNORE='op:opr:mlgw:cs:mll:ax:jr*:gitx:hista:mlwg:aes*:on:mdb*:histm: *'

alias h='history | grep '
alias hist='history | less '


# Bash Settings
shopt -s histappend          # all sessions are saved 
shopt -s cdspell             # fix minor error in cd paths
shopt -s histreedit          # allows re-edit on C-R

export EDITOR='vim'          # default editor 
export FIGNORE=$FIGNORE:.pyc:.o:.class

[ -f ~/.completion/git-completion.bash ] &&  source ~/.completion/git-completion.bash 
[ -f  ~/.bash/bashmarks.bash ]           &&  source ~/.bash/bashmarks.bash

# Path settings(bin before current $PATH to override default version)
export PATH=$HOME/bin:/usr/local/bin:$PATH
# scripts
export PATH=$PATH:/usr/local/sbin:$HOME/scripts:$HOME/bin/mplayer_osx
# pkg config# pkg config# pkg config
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig"

