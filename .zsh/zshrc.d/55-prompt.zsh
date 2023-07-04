#if [ ${UID} -eq 0 ]; then
zi light-mode for @romkatv/powerlevel10k
#      zi ice pick"async.zsh" src"pure.zsh"
#        zi light sindresorhus/pure
#zi lucid for nocd \
#  halfo/lambda-mod-zsh-theme
#        zi lucid nocd atinit"AGKOZAK_COLORS_PROMPT_CHAR='magenta' AGKOZAK_MULTILINE=0 \
#          AGKOZAK_PROMPT_CHAR=( ❯ ❯ ❮ ) AGKOZAK_USER_HOST_DISPLAY=0" for \
#           agkozak/agkozak-zsh-prompt
#zi ice as"command" from"gh-r" \
#  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
#  atpull"%atclone" src"init.zsh"
#zi light starship/starship

# >‑‑‑‑‑‑ { THEME settings } ‑‑‑‑‑‑> | ##################################################
#https://github.com/b-ryan/powerline-shell#zsh
if [[ $(whoami) != "qgrep" ]]; then
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}
function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}
if [ "$TERM" != "linux" -a -x "$(command -v powerline-shell)" ]; then
    install_powerline_precmd
fi
fi
