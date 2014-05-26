# Path settings(bin before current $PATH to override default version)

PATH=$HOME/bin:$HOME/bin/haskell_stuff:$PATH
PATH=$PATH:$HOME/.cabal/bin
PATH=$PATH:/Users/bilalh/Projects/Shell-Tunes/extra


[ -d ~/.pscripts/  ] && PATH=$PATH:~/.pscripts
[ -d ~/.Utilities/ ] && for i in ~/.Utilities/*; do PATH=$PATH:$i; done
PATH=$PATH:/Users/bilalh/CS/minion/build
PATH=$PATH:/Users/bilalh/CS/savilerow
#PATH=$PATH:/Applications/Mkvtoolnix.app/Contents/MacOS
PATH=$PATH:/Users/bilalh/Projects/media2/.cabal-sandbox/bin
export PATH

#export ANDROID_SDK=$HOME/Programming/Java/android-sdk-mac_x86
export RUBY_PLATFORM="darwin"
export R_HOME=/Library/Frameworks/R.framework/Resources

export CONJURE_REPO="/Users/bilalh/CS/conjure/"
