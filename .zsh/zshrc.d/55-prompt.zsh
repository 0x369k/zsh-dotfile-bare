#if [ ${UID} -eq 0 ]; then
#zi light-mode for @romkatv/powerlevel10k
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


#❯■■■■■■■■■❯theme❮statship❯■■■■■■■■■❯
zi lucid for \
as"command" from"gh-r" atinit'export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"' atload'eval "$(starship init zsh)"' bpick'*unknown-linux-gnu*' \
  starship/starship 


#❯■■■■■■■■■❯theme❮settings❯■■■■■■■■■❯
#https://github.com/b-ryan/powerline-shell#zsh
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


#❯■■■■■■■■■❯Theme no. 1❮zprompts❯■■■■■■■■■❯
zi lucid \
load'![[ $MYPROMPT = 1 ]]' \
unload'![[ $MYPROMPT != 1 ]]' \
atload'!promptinit; typeset -g PSSHORT=0; prompt sprint3 yellow red green blue' \
nocd for \
z-shell/zprompts

#❯■■■■■■■■■❯Theme no. 2❮lambda-mod-zsh-theme❯■■■■■■■■■❯
zi lucid load'![[ $MYPROMPT = 2 ]]' unload'![[ $MYPROMPT != 2 ]]' nocd for \
halfo/lambda-mod-zsh-theme

#❯■■■■■■■■■❯Theme no. 3❮lambda-gitster❯■■■■■■■■■❯
zi lucid load'![[ $MYPROMPT = 3 ]]' unload'![[ $MYPROMPT != 3 ]]' nocd for \
ergenekonyigit/lambda-gitster

#❯■■■■■■■■■❯Theme no. 4❮geometry❯■■■■■■■■■❯
zi lucid load'![[ $MYPROMPT = 4 ]]' unload'![[ $MYPROMPT != 4 ]]' \
atload'!geometry::prompt' nocd \
atinit'GEOMETRY_COLOR_DIR=63 GEOMETRY_PATH_COLOR=63' for \
geometry-zsh/geometry

#❯■■■■■■■■■❯Theme no. 5❮pure❯■■■■■■■■■❯
zi lucid load'![[ $MYPROMPT = 5 ]]' unload'![[ $MYPROMPT != 5 ]]' \
pick"/dev/null" multisrc"{async,pure}.zsh" atload'!prompt_pure_precmd' nocd for \
sindresorhus/pure

#❯■■■■■■■■■❯Theme no. 6❮agkozak-zsh-theme❯■■■■■■■■■❯
zi lucid load'![[ $MYPROMPT = 6 ]]' unload'![[ $MYPROMPT != 6 ]]' \
atload'!_agkozak_precmd' nocd atinit'AGKOZAK_FORCE_ASYNC_METHOD=subst-async' for \
agkozak/agkozak-zsh-theme

#❯■■■■■■■■■❯Theme no. 7❮zinc❯■■■■■■■■■❯
zi load'![[ $MYPROMPT = 7 ]]' unload'![[ $MYPROMPT != 7 ]]' \
compile"{zinc_functions/*,segments/*,zinc.zsh}" nocompletions \
atload'!prompt_zinc_setup; prompt_zinc_precmd' nocd for \
robobenklein/zinc

#❯■■■■■■■■■❯Theme no. 8❮git-prompt❯■■■■■■■■■❯
zi lucid load'![[ $MYPROMPT = 8 ]]' unload'![[ $MYPROMPT != 8 ]]' \
atload'!_zsh_git_prompt_precmd_hook' nocd for \
woefe/git-prompt.zsh

#❯■■■■■■■■■❯Theme no. 9❮powerlevel10k❯■■■■■■■■■❯
zi ice load'![[ $MYPROMPT = 9 ]]' unload'![[ $MYPROMPT != 9 ]]' \
  atload'source ~/.zsh/.p10k.zsh; _p9k_precmd' wrap'_p9k_precmd'
zi load romkatv/powerlevel10k