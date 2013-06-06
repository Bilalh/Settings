# \u is username
#export PS1="\u: $ "              # bash prompt
export PS1='Bilalh$(__git_ps1 "@%s") \$ '  # Shows Git branch
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

export LC_CTYPE=en_GB.UTF-8;
export LANG=en_GB.UTF-8

#for gnu parallel
export PARALLEL="-j7"

# bilalh@8afbf821: [develop]      full colour + commit id + branch
#export PS1='\[$(tput setaf 3)\]\u@\h:\[$(tput sgr0)$(tput setaf 5)\]\[$(tput sgr0)$(tput setaf 2)\] $(__git_ps1 "[%s]") \[$(tput sgr0)\]$ '
### History Settings
export HISTFILESIZE=15000    # the bash history should save 15000 commands
export HISTCONTROL=erasedups # remove duplicate from history

# don't store history entries that match this pattern  
declare -x HISTIGNORE='cs:jr*:gitx:hista:aes*:srm*: *'

alias h='history | grep '
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

# Completion for git + others
[ -d /usr/local/etc/bash_completion.d/ ] &&  for i in /usr/local/etc/bash_completion.d/*; do source $i; done

# bashmarks
[ -f  ~/.local/bin/bashmarks.sh ]  && source ~/.local/bin/bashmarks.sh 

### Path Settings 
# Path settings(bin before current $PATH to override default version)
PATH=$HOME/bin:$HOME/bin/haskell_stuff:/usr/local/bin:$PATH
PATH=$PATH:/usr/local/sbin:$HOME/bin/mplayer_osx
PATH=$HOME/Library/Haskell/bin:$HOME/.cabal/bin:$PATH

# Scripts for PATH 
[ -d ~/.pscripts/  ] && PATH=$PATH:~/.pscripts
[ -d ~/.Utilities/ ] && for i in ~/.Utilities/*; do PATH=$PATH:$i; done
PATH=$PATH:/Users/bilalh/Projects/Shell-Tunes/extra
PATH=$PATH:~/.rvm/gems/ruby-1.9.3-p286/bin
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.3/bin
#PATH=$PATH:$HOME/Programming/Java/android-sdk-mac_x86/platform-tools

#cs PATH
#PATH=$PATH:/Users/bilalh/CS/conjure/scripts/other
#PATH=$PATH:/Applications/Comet
PATH=$PATH:/Users/bilalh/CS/minion-build
PATH=$PATH:/Users/bilalh/CS/savilerow
PATH=$PATH:/Users/bilalh/CS/conjure/test/solving
PATH=$PATH:/Users/bilalh/CS/conjure/scripts/other
export PATH

#Other Stuff
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
#export ANDROID_SDK=$HOME/Programming/Java/android-sdk-mac_x86
export RUBY_PLATFORM="darwin"
export R_HOME=/Library/Frameworks/R.framework/Resources

### aliases and other functions
[ -f ~/.bashrc ] && source ~/.bashrc

alias comp='. `brew --prefix`/etc/bash_completion'

export CONJURE_REPO="~/CS/conjure"
