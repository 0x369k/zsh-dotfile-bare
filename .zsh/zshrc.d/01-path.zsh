#❯■■■■■■■■■❯zsh❮❯■■■■■■■■■❯
fpath=($ZDOTDIR/completion $fpath) # Load more completions
export ZDOTDIR=${HOME}/.zsh



#❯■■■■■■■■■❯home❮❯■■■■■■■■■❯
export PATH=/home/$USER/.local/bin:/home/$USER/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH="$PATH:/snap/bin":$PATH 
export PATH=$HOME/shell/:$PATH
export PATH=$HOME/.docker/cli-plugins/:$PATH 
                export PATH=$1/usr/bin/:$PATH
                export PATH=$1/usr/sbin/:$PATH
                export XDG_DATA_DIRS=$1/share:$XDG_DATA_DIRS

#export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
#export PATH="$HOME/.export/bin:$PATH "
#export PATH="$HOME/.export/go/bin:$PATH"

#[ -f "$HOME/.cargo/env" ] && source $HOME/.cargo/env



#❯■■■■■■■■■❯work❮❯■■■■■■■■■❯
export PATH=$PATH:/qq/bin:$PATH
export PATH="/qq/lib/code/shell/snippets:$PATH"

#export ANDROID_HOME=$HOME/Android/Sdk
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:$ANDROID_HOME/platform-tools

#go
#export PATH=$PATH:/usr/export/go/bin:$HOME/go
#export GOPATH=$HOME/go
#[[ ! -r "/usr/export/go/bin/go" ]] && {
#  wget -P /tmp https://go.dev/dl/go1.20.1.linux-amd64.tar.gz 
#  sudo tar -C /usr/export -xzf /tmp/go1.20.1.linux-amd64.tar.gz
#}  

#pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"


