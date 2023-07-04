#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

export PATH=$HOME/shell/:$PATH


LANG=en_US.UTF-8
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL="en_US.UTF-8"


declare -A ZI
export ZI[HOME_DIR]="/home/$(whoami)/.zsh/.zi"
export ZI[BIN_DIR]="$ZI[HOME_DIR]/bin"
export ZI[COMPLETIONS_DIR]="$ZI[HOME_DIR]/completions"	#Completion working directory 
export ZI[CACHE_DIR]="$HOME/.cache/zi"					#Cache directory
export ZI[CONFIG_DIR]="$HOME/.config/zi"				#Directory for configuration files
export ZI[MAN_DIR]="$ZPFX/man"							#Directory to store manpages
export ZI[LOG_DIR]="$ZI[CACHE_DIR]/log"					#Directory to store log files
export ZI[PLUGINS_DIR]="$ZI[HOME_DIR]/plugins"			#Plugins working directory
export ZI[SNIPPETS_DIR]="$ZI[HOME_DIR]/snippets"		#Snippets working directory
export ZI[ZCOMPDUMP_PATH]="${ZI[CACHE_DIR]}/.zcompdump"	#Path to .zcompdump file
export ZI[ZMODULES_DIR]="$ZI[HOME_DIR]/zmodules"		#Zsh modules working directory
export ZPFX="$ZI[HOME_DIR]/polaris"						#Directory to store binary and related files

typeset -Ag ZI
typeset -gx ZI[HOME_DIR]="${HOME}/.zi" ZI[BIN_DIR]="${ZI[HOME_DIR]}/bin"
if [[ ! -d "${ZI[HOME_DIR]}"/bin ]]; then
git clone https://github.com/z-shell/zi.git --depth 1 "${ZI[HOME_DIR]}"/bin
#sh -c "$(curl -fsSL get.zshell.dev)" -- -a annex
fi
source "${ZI[HOME_DIR]}"/bin/zi.zsh
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi


zi-info () {
  clear && echo Vervollständigungenalle Plugins &&  zi clist && echo && echo "Befehl zi csearch durchsucht alle Plugin  Verzeichnisse nach verfügbaren Vervollständigungen:" && zi csearch
}


zi light z-shell/z-a-rust
zi ice rustup cargo'!atuin'
zi load z-shell/0


#❯■■■■■■■■■❯zi❮cargo❯ ■■■■■■■■■❯
zi light z-shell/z-a-rust
zi ice rustup cargo'!atuin'
zi load z-shell/0
eval "$(atuin init zsh)"

zi wait lucid for \
    atinit:"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        "z-shell/fast-syntax-highlighting" \
           "z-shell/F-Sy-H" \
    blockf atpull:"zi creinstall zsh-users/zsh-completions"\
        "zsh-users/zsh-completions" \
    atload:"!_zsh_autosuggest_start" \
        "zsh-users/zsh-autosuggestions" \
        "zpm-zsh/ls" \
        "le0me55i/zsh-extract" \
        "z-shell/nb" 

zi ice wait"1" lucid
zi light lukechilds/zsh-nvm
export NVM_AUTO_USE=true    


#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯
#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯
#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ANFANG❯ ■■■■■■■■■❯


zi ice from"gh-r" as"program"
zi light junegunn/fzf



zi ice lucid wait as'program' from"gh-r" has'fzf'
zi load denisidoro/navi
eval "$(navi widget zsh)"




#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯
#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯
#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯#❯■■■■■■■■■❯ENV❮ENDE❯ ■■■■■■■■■❯


#WEITER=TRUE
if [ "$WEITER" = "TRUE" ]; then 
zi ice from'gh-r' as'program'
zi light junegunn/fzf
zi wait pack atload=+"zicompinit; zicdreplay" for system-completions



#❯■■■■■■■■■❯zi❮NVM❯ ■■■■■■■■■❯



#❯■■■■■■■■■❯zi❮cargo❯ ■■■■■■■■■❯
#zi for z-shell/z-a-meta-plugins @annexes @rust-utils
#zi id-as"rust" wait=1 as=null sbin="bin/*" lucid rustup nocompile \
#atload="[[ ! -f ${ZI[COMPLETIONS_DIR]}/_cargo ]] && zi creinstall -q rust; \
#export CARGO_HOME=\$PWD; export RUSTUP_HOME=\$PWD/rustup" for \
zi light z-shell/z-a-rust
zi ice rustup cargo'!atuin'
zi load z-shell/0








#❯■■■■■■■■■❯zi❮annexes❯ ■■■■■■■■■❯
zi light z-shell/z-a-bin-gem-node
zi for z-shell/z-a-meta-plugins  @annexes  
#zi light-mode compile'functions/.*za-*~*.zwc' for z-shell/z-a-meta-plugins @annexes \
#  atinit'Z_A_USECOMP=1' compile'functions/.*ev*~*.zwc' z-shell/z-a-eval

#@rust-utils
#zi id-as"rust" wait=1 as=null sbin="bin/*" lucid rustup nocompile \
#atload="[[ ! -f ${ZI[COMPLETIONS_DIR]}/_cargo ]] && zi creinstall -q rust; \
#export CARGO_HOME=\$PWD; export RUSTUP_HOME=\$PWD/rustup" for \
#z-shell/0
# ANNEX ============================================================================================================== #
#zi light-mode compile'functions/.*za-*~*.zwc' for z-shell/z-a-meta-plugins @annexes



#zi wait"2" lucid as"null" for \
#sbin atclone"./build.zsh" atpull"%atclone" \
#  molovo/zunit \
#sbin"color.zsh -> color" \
#  molovo/color


zi wait lucid for \
    atinit:"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        "z-shell/fast-syntax-highlighting" \
           "z-shell/F-Sy-H" \
    blockf atpull:"zi creinstall zsh-users/zsh-completions"\
        "zsh-users/zsh-completions" \
    atload:"!_zsh_autosuggest_start" \
        "zsh-users/zsh-autosuggestions" \
        "zpm-zsh/ls" \
        "le0me55i/zsh-extract" \
        "z-shell/nb" 

zi for z-shell/z-a-meta-plugins @annexes @rust-utils \
  skip'git-extras' @ext-git \
  skip'peko skim fzy' @fuzzy \
  skip'hexyl hyperfine vivid tig' @console-tools \
  skip'F-Sy-H' @z-shell @zsh-users+fast @romkatv \
#array=({git,functions,history,completion,prompt_info_functions,grep,completion,vcs_info}.zsh)
zi-turbo '0a' lucid is-snippet for has'svn' svn multisrc'$array' pick'/dev/null' \
  atinit'HISTFILE=${HOME}/.cache/zi/zsh-history; COMPLETION_WAITING_DOTS=true' OMZ::lib
zi-turbo '0b' lucid is-snippet for \
  atload"unalias grv g" OMZP::git
zi-turbo '0c' lucid light-mode for \
  atinit'AUTOCD=1' zplugin/zsh-exa \
    MichaelAquilina/zsh-you-should-use 


zi ice lucid wait as'program' from"gh-r" has'fzf'
zi light denisidoro/navi
zi ice from'gh-r' as'program' mv'fd* fd' sbin'**/fd(.exe|) -> fd'
zi light @sharkdp/fd
zi ice from'gh-r' as'program' mv'bat* bat' sbin'**/bat(.exe|) -> bat'
zi light @sharkdp/bat
zi ice lucid wait as'program' has'bat' pick'src/*'
zi light eth-p/bat-extras

zi-turbo '0c' lucid light-mode for \
atinit'AUTOCD=1' zplugin/zsh-exa \
MichaelAquilina/zsh-you-should-use

#❯■■■■■■■■■❯zi❮OH-MY-ZSH PLUGINS❯ ■■■■■■■■■❯
  zi is-snippet wait lucid for \
    atload"unalias grv g" \
 OMZP::{git,sudo,dotenv,extract,pip,copypath,copyfile,gh,dirhistory,copybuffer,mosh,nmap,web-search,fzf} \
    if'[[ -d ~/.nvm ]]' \
  OMZP::nvm \
    if'[[ -d ~/.ssh ]]' \
  OMZP::ssh-agent \
    if'[[ -d ~/.gnupg ]]' \
  OMZP::gpg-agent \
    if'[[ "$OSTYPE" = *-gnu ]]' \
  OMZP::gnu-utils \
    has'pip' \
  OMZP::pip \
    has'python' \
  OMZP::python


zi snippet 'OMZL::completion.zsh' #better completion settings

zi ice wait \
	atclone'(( !${+commands[dircolors]} )) && export P=g; \
	${P}sed -i "/DIR/c\\DIR 38;5;63;1" dircolors.ansi-universal; \
    TERM=ansi ${P}dircolors -b dircolors.ansi-universal >! colors.zsh' \


# Theme no. 1 - zprompts #######################
zi lucid \
load'![[ $MYPROMPT = 1 ]]' \
unload'![[ $MYPROMPT != 1 ]]' \
atload'!promptinit; typeset -g PSSHORT=0; prompt sprint3 yellow red green blue' \
nocd for \
z-shell/zprompts

# Theme no. 2 – lambda-mod-zsh-theme
zi lucid load'![[ $MYPROMPT = 2 ]]' unload'![[ $MYPROMPT != 2 ]]' nocd for \
halfo/lambda-mod-zsh-theme

# Theme no. 3 – lambda-gitster
zi lucid load'![[ $MYPROMPT = 3 ]]' unload'![[ $MYPROMPT != 3 ]]' nocd for \
ergenekonyigit/lambda-gitster

# Theme no. 4 – geometry
zi lucid load'![[ $MYPROMPT = 4 ]]' unload'![[ $MYPROMPT != 4 ]]' \
atload'!geometry::prompt' nocd \
atinit'GEOMETRY_COLOR_DIR=63 GEOMETRY_PATH_COLOR=63' for \
geometry-zsh/geometry

# Theme no. 5 – pure
zi lucid load'![[ $MYPROMPT = 5 ]]' unload'![[ $MYPROMPT != 5 ]]' \
pick"/dev/null" multisrc"{async,pure}.zsh" atload'!prompt_pure_precmd' nocd for \
sindresorhus/pure

# Theme no. 6 - agkozak-zsh-theme
zi lucid load'![[ $MYPROMPT = 6 ]]' unload'![[ $MYPROMPT != 6 ]]' \
atload'!_agkozak_precmd' nocd atinit'AGKOZAK_FORCE_ASYNC_METHOD=subst-async' for \
agkozak/agkozak-zsh-theme

# Theme no. 7 - zinc
zi load'![[ $MYPROMPT = 7 ]]' unload'![[ $MYPROMPT != 7 ]]' \
compile"{zinc_functions/*,segments/*,zinc.zsh}" nocompletions \
atload'!prompt_zinc_setup; prompt_zinc_precmd' nocd for \
robobenklein/zinc

# Theme no. 8 - git-prompt
zi lucid load'![[ $MYPROMPT = 8 ]]' unload'![[ $MYPROMPT != 8 ]]' \
atload'!_zsh_git_prompt_precmd_hook' nocd for \
woefe/git-prompt.zsh

# zunit, color
zi wait"2" lucid as"null" for \
sbin atclone"./build.zsh" atpull"%atclone" \
molovo/zunit \
sbin"color.zsh -> color" \
molovo/color

fi

#zi pack for dircolors-material



#zi for z-shell/z-a-meta-plugins @annexes \
#skip'git-extras' @ext-git \
#skip'peko skim fzy' @fuzzy \
#skip'hexyl hyperfine vivid tig' @console-tools \
#skip'F-Sy-H' @z-shell @zsh-users+fast @romkatv

#zi wait lucid for \
#atinit:"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
#"z-shell/fast-syntax-highlighting" \
#"z-shell/F-Sy-H" \
#blockf atpull:"zi creinstall zsh-users/zsh-completions"\
#"zsh-users/zsh-completions" \
#atload:"!_zsh_autosuggest_start" \
#"zsh-users/zsh-autosuggestions" \
#    "zpm-zsh/ls" \
#"le0me55i/zsh-extract" \
#"z-shell/nb"

#zi wait for \
#sbin        junegunn/fzf-bin
#zi pack"default+keys" for fzf

#zi-turbo '0a' lucid is-snippet for has'svn' svn multisrc'$array' pick'/dev/null' \
#atinit'HISTFILE=${HOME}/.cache/zi/zsh-history; COMPLETION_WAITING_DOTS=true' OMZ::lib
#zi-turbo '0b' lucid is-snippet for \
#atload"unalias grv g" OMZP::git
#zi-turbo '0c' lucid light-mode for \
#atinit'AUTOCD=1' zplugin/zsh-exa \
#MichaelAquilina/zsh-you-should-use \

#❯■■■■■■■■■❯RUST❮ CARGO ❯ ■■■■■■■■■❯
#zi light z-shell/z-a-rust
#zi id-as"rust" wait=1 as=null sbin="bin/*" lucid rustup nocompile \
#atload="[[ ! -f ${ZI[COMPLETIONS_DIR]}/_cargo ]] && zi creinstall -q rust; \
#export CARGO_HOME=\$PWD; export RUSTUP_HOME=\$PWD/rustup" for \
#z-shell/0
#zi ice rustup cargo'!atuin'

LANG=de_DE.UTF-8
LC_CTYPE="de_DE.UTF-8"
LC_NUMERIC="de_DE.UTF-8"
LC_TIME="de_DE.UTF-8"
LC_COLLATE="de_DE.UTF-8"
LC_MONETARY="de_DE.UTF-8"
LC_MESSAGES="de_DE.UTF-8"
LC_PAPER="de_DE.UTF-8"
LC_NAME="de_DE.UTF-8"
LC_ADDRESS="de_DE.UTF-8"
LC_TELEPHONE="de_DE.UTF-8"
LC_MEASUREMENT="de_DE.UTF-8"
LC_IDENTIFICATION="de_DE.UTF-8"
LC_ALL="de_DE.UTF-8"
eval "$(atuin init zsh)"

eval "$(atuin init zsh)"
