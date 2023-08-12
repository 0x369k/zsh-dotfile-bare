export NOW=$(date +"%Y-%m-%d_%H:%M:%S")
export DATE=$(date +'%Y-%m-%d')
export DATEHOUR=$(date +%F_%H-%M-%S)
export TERM="xterm-256color" 


#❯■■■■■■■■■❯default❮prog❯■■■■■■■■■❯
# [ -n "$DISPLAY" ] && export EDITOR="code"  
# [ -n "$DISPLAY" ] && export VISUAL="code"      
  export EDITOR="nano"
# [ -n "$DISPLAY" ] && export MDEDITOR="marktext"        || export BROWSER="nano"
  [ -n "$DISPLAY" ] && export BROWSER="firefox"          || export BROWSER="lynx"
  [ -n "$DISPLAY" ] && export NB_GUI_BROWSER="firefox"   || export BROWSER="lynx"
  [ -n "$DISPLAY" ] && export IMAGEVIEWER="shotwell"     || export BROWSER="shotwell"
# >‑‑‑‑‑‑ { standart open with } ‑‑‑‑‑‑> |
alias -s {index}="$BROWSER"
alias -s {txt,md}="$MDEDITOR"
alias -s {gif,GIF,jpeg,JPEG,jpg,JPG,png,PNG}="$IMAGEVIEWER"



ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#073642,bg=#839496,bold,underline"
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bold,underline,standout"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=100


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

#❯■■■■■■■■■❯tldr❮❯■■■■■■■■■❯
export TLDR_COLOR_NAME="cyan"
export TLDR_COLOR_DESCRIPTION="white"
export TLDR_COLOR_EXAMPLE="green"
export TLDR_COLOR_COMMAND="red"
export TLDR_COLOR_PARAMETER="white"
export TLDR_LANGUAGE="de"
export TLDR_CACHE_ENABLED=1
export TLDR_CACHE_MAX_AGE=720
export TLDR_PAGES_SOURCE_LOCATION="https://raw.githubusercontent.com/tldr-pages/tldr/main/pages"
export TLDR_DOWNLOAD_CACHE_LOCATION="https://tldr-pages.github.io/assets/tldr.zip"

#❯■■■■■■■■■❯if❮window class❯■■■■■■■■■❯
# VSCode
#if [[ $TERM_PROGRAM == "vscode" ]]; then
  # start a tmux session
#  if [[ $VSCODE_TERM_PROFILE == "tmux" ]]; then
#    if [ -z "$TMUX" ]; then
#      $HOME/.dotfiles/scripts/tmux-folder-session.sh
#    fi
#  fi
#fi



#zypper() {
#    if [ "$1" = "dup" ]; then
#        shift        # eat the 'update'
#       zypper --allow-vendor-change "$@" 
#    else
#        command zypper "$@"
#    fi
#}

