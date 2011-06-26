
[ -f ~/.bashrc ] && source ~/.bashrc

export PS1="Bilalh: $ "      # bash prompt

### History Settings
export HISTFILESIZE=10000    # the bash history should save 10000 commands
export HISTCONTROL=erasedups # remove duplicate from history

# don't store history entries that match this pattern
declare -x HISTIGNORE='op:opr:mlgw:cs:mll:ax:jr*:gitx:hista:mlwg:aes*:hda:on:mdb*:histm: *'

alias h='history | grep '
alias hist='history | less '


### Bash options 
shopt -s histappend          # all sessions are saved 
shopt -s cdspell             # fix minor error in cd paths
shopt -s histreedit          # allows re-edit on C-R

export EDITOR='vim'          # default editor 
# Ignores files in tab completion
export FIGNORE=$FIGNORE:.pyc:.o:.class

# Colorize the prompt and commands such as ls
export CLICOLOR=1
export LSCOLORS=ExFxCxDxbxegedabagacad

source ~/.completion/git-completion.bash # git auto complete
source ~/.bash/bashmarks.bash

### Path Settings 
# Path settings(bin before current $PATH to override default version)
export PATH=$HOME/bin:/usr/local/bin:$PATH
# scripts
export PATH=$PATH:/usr/local/sbin:$HOME/scripts:$HOME/bin/mplayer_osx
# pkg config# pkg config# pkg config
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig"

