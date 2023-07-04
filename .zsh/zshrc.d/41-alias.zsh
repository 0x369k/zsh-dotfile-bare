alias -g gd="git status -s \
 | fzf --no-sort --reverse \
 --preview 'git diff --color=always {+2} | diff-so-fancy' \
 --bind=ctrl-j:preview-down --bind=ctrl-k:preview-up \
 --preview-window=right:60%:wrap"

alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias qdbus="qdbus-qt5"

alias -g devnull=" > /dev/null 2>&1 &"  
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@'

alias  exad="exa -g --octal-permissions --icons --long --tree --sort=changed -L=1 -D --all"
alias  exaa="exa -g --octal-permissions --icons --long --tree --sort=changed -L=1 --all"
alias  exa="exa -g --octal-permissions --icons --long --tree --sort=changed -L=1"
alias exa2="exa -g --octal-permissions --icons --long --tree --sort=changed -L=2"
alias exa3="exa -g --octal-permissions --icons --long --tree --sort=changed -L=3"
alias exa4="exa -g --octal-permissions --icons --long --tree --sort=changed -L=4"
alias exa5="exa -g --octal-permissions --icons --long --tree --sort=changed -L=5"
alias exa6="exa -g --octal-permissions --icons --long --tree --sort=changed -L=6"
alias exa7="exa -g --octal-permissions --icons --long --tree --sort=changed -L=7"
alias exa8="exa -g --octal-permissions --icons --long --tree --sort=changed -L=8"
alias -g  Z='| fzf'
alias -g  Z='| fzf'
alias -g CG='2>&1 |noglob grep --color=always'
alias -g  G='2>&1 |noglob grep'
alias -g  L='2>&1 |less'
alias -g  B='2>&1 |bat'
alias -g C='| wc -l'

alias get-ports="netstat -tulnp | grep LISTEN"
alias get-router="ip route | grep default"
alias get-ip="hostname -I"

  # [ -z "$BUFFER" ] && zle up-history
    # confirm command
    #zle accept-line

alias cz="chezmoi"

alias e="$EDITOR $@"
alias ec="$EDITOR $HOME/.zshrc"
alias exc="exec zsh"
alias zalias=".zsh/config/alias.zsh"

alias -g .zsh="~/.zsh"
alias -g h='$HOME'

alias -g c='code'
alias -g co='codium'
alias -g na='nano'

alias tw='the-way'

alias -g p='pwd'
alias -g s='source'





alias -g docker-compose='docker compose'
alias -g 1DN='>/dev/null'
alias -g 2DN='2>/dev/null'
alias -g DN='1DN 2DN'

alias -g qqsk='/qq/lib/code/skripte'
alias -g qqsn='/qq/lib/code/snippets'
alias -g qqsand='/qq/dev/sandbox'
alias -g qqdev='/qq/dev'
alias -g qqq='/qq'
alias -g qqnb='/qq/lib/nb'
alias -g qqsh='~/qq/lib/code/shell'



# general
alias help="man"
alias t="tail -f"
alias ff="find . -type f -name"
#(($ + commands[fd])) || alias fd='find . -type d -name'
alias fd="find . -type d -name"
alias grep="grep --color"
alias sgrep="grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}"
alias processes="ps -f"

# git
# ! define in ~/.gitconfig

# alias to avoid making mistakes
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# networking
alias ports="netstat -tulnp | grep LISTEN"
alias router="ip route | grep default"
alias ip-private="hostname -I | awk {'print $1}'"
alias ip-public="curl -4 ifconfig.co"

# compilers, repl, etc.
# alias python="python3"

# directories
# alias goto-dev="cd ~/dev/"

# tmux
alias tmuxconf="code ~/.tmux.conf.local"

# git
# ! define in ~/.gitconfig
if [ -x "$(command -v fzf)" ]; then
  alias commits="git log --oneline | fzf --preview 'git show --name-only {1}'"
fi

# firefox developer
alias firefox-dev="/opt/firefox/firefox"



