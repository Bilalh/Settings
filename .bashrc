#Adds all files in .bash at lanuch
[ -d ~/.bash/ ] &&  for i in ~/.bash/*.sh; do source $i; done

[ -d ~/.pbash/ ] &&  for i in ~/.pbash/*.sh; do source $i; done

source ~/.settings/paths.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
