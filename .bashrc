#Adds all files in .bash at lanuch
[ -d ~/.bash/ ] &&  for i in ~/.bash/*.sh; do source $i; done

[ -d ~/.pbash/ ] &&  for i in ~/.pbash/*.sh; do source $i; done


export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:$PATH

export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"
