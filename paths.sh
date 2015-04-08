
unset PATH
eval `/usr/libexec/path_helper -s`

#PATH=$HOME/.tools/ghc/7.6.3/bin:$PATH
PATH=$HOME/.tools/ghc/7.8.3/bin:$PATH
PATH=$HOME/.cabal/bin:$PATH

PATH=$HOME/bin:$PATH
# PATH=$HOME/bin:/usr/local/bin:$PATH

PATH=$PATH:$HOME/Projects/media2/.cabal-sandbox/bin
PATH=$PATH:$HOME/Programming/hdevtools/.cabal-sandbox/bin
#PATH=$HOME/Programming/hs_sandbox/.cabal-sandbox/bin:$PATH



[ -d ~/.pscripts/  ] && PATH=$PATH:~/.pscripts
[ -d ~/.Utilities/ ] && for i in ~/.Utilities/*; do PATH=$PATH:$i; done

PATH=$PATH:/Users/bilalh/CS/_zsmall/bibtex_sente


PATH=$PATH:/Users/bilalh/CS/minion/build
PATH=$PATH:/Users/bilalh/CS/savilerow

#PATH=$PATH:/Applications/Mkvtoolnix.app/Contents/MacOS
PATH=$PATH:/Users/bilalh/Projects/Shell-Tunes/extra

PATH=$PATH:~/binEnd

export PATH

export CONJURE_REPO="/Users/bilalh/CS/conjure/"
export REPO_CONJURE="/Users/bilalh/CS/conjure-private"
export CONJURE_LIB="/Users/bilalh/CS/conjure-lib"


export RUBY_PLATFORM="darwin"
export R_HOME=/Library/Frameworks/R.framework/Resources
export GOPATH="/Users/bilalh/Programming/go"

export BYOBU_PREFIX=$(brew --prefix)
# export DEVELOPMENT_MODE=yes


export SAVED_BINARIES="/Users/bilalh/Desktop/Results/binaries"
export HOST_TYPE="bh_laptop"
