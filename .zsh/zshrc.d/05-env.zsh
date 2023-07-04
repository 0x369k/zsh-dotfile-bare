export NOW=$(date +"%Y-%m-%d_%H:%M:%S")
export DATE=$(date +'%Y-%m-%d')
export DATEHOUR=$(date +%F_%H-%M-%S)
export TERM="xterm-256color" 




# >‑‑‑‑‑‑ { Default programs } ‑‑‑‑‑‑> |
# [ -n "$DISPLAY" ] && export EDITOR="code"  
# [ -n "$DISPLAY" ] && export VISUAL="code"      
  export EDITOR="nano"
# [ -n "$DISPLAY" ] && export MDEDITOR="marktext"        || export BROWSER="nano"
  [ -n "$DISPLAY" ] && export BROWSER="firefox"          || export BROWSER="lynx"
  [ -n "$DISPLAY" ] && export NB_GUI_BROWSER="firefox"   || export BROWSER="lynx"
  [ -n "$DISPLAY" ] && export IMAGEVIEWER="shotwell"     || export BROWSER="shotwell"
# >‑‑‑‑‑‑ { standartmäßig öffnen mit } ‑‑‑‑‑‑> |
alias -s {index}="$BROWSER"
alias -s {txt,md}="$MDEDITOR"
alias -s {gif,GIF,jpeg,JPEG,jpg,JPG,png,PNG}="$IMAGEVIEWER"



# edit file as root with vscode
#Set environment variable:
export VISUAL="code -nw"
#Then you can edit any file like this:
#sudo -e file
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"


export HISTFILE="${ZDOTDIR}"/history
export HISTSIZE=1000000
export SAVEHIST=1000000
#REPORTTIME=3
export HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

if [[ "$TTY" == "/dev/tty4" ]]; then
	#startx -- -logverbose 9 -verbose 9 2>&1 | tee ~/log/startx.log
	export XDG_SESSION_TYPE=wayland
	export XDG_SESSION_TYPE=tty
fi

# >‑‑‑‑‑‑ { if fenstertitel } ‑‑‑‑‑‑> |
# VSCode
if [[ $TERM_PROGRAM == "vscode" ]]; then
echo vscode
  # start a tmux session
#  if [[ $VSCODE_TERM_PROFILE == "tmux" ]]; then
#    if [ -z "$TMUX" ]; then
#      $HOME/.dotfiles/scripts/tmux-folder-session.sh
#    fi
#  fi
fi

#zypper() {
#    if [ "$1" = "dup" ]; then
#        shift        # eat the 'update'
#       zypper --allow-vendor-change "$@" 
#    else
#        command zypper "$@"
#    fi
#}


# cargo normal
#[ -f "$HOME/.cargo/env" ] && source $HOME/.cargo/env
# navi
[ -d "$HOME/.export/share/navi/cheats/" ] && export NAVI=$HOME/.export/share/navd/cheats/

