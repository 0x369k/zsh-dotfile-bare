#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi


#❯■■■■■■■■■❯zi❮init❯■■■■■■■■■❯
if [[ ! -d "${ZI[HOME_DIR]}"/bin ]]; then
# bootstrap
sh $HOME/.zsh/bootstrap.sh
 mkdir -p "$ZI[HOME_DIR]" && chmod g-rwX "$ZI[HOME_DIR]"
git clone https://github.com/z-shell/zi.git --depth 1 "${ZI[HOME_DIR]}"/bin && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "${ZI[HOME_DIR]}"/bin/zi.zsh
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi



#❯■■■■■■■■■❯info❮help function❯■■■■■■■■■❯
zi-info () {
  clear 
    print -P "\n%F{122}■ zi cdlist ❯ Vervollständigungen alle Plugins%f%b" 
      printf '\033[1;42m%-*s\033[0m\n' "${COLUMNS:-$(tput cols || true)}" "▓▒░ ★ » $1" | tr ' ' ' '
  zi cdlist
  echo 
  print -P "%F{122}■ zi zstatus ❯ Overall ZI status"
    printf '\033[1;42m%-*s\033[0m\n' "${COLUMNS:-$(tput cols || true)}" "▓▒░ ★ » $1" | tr ' ' ' '
  zi zstatus 
    echo 
  print -P "%F{122}■ zi loaded ❯ Show loaded plugins"
    printf '\033[1;42m%-*s\033[0m\n' "${COLUMNS:-$(tput cols || true)}" "▓▒░ ★ » $1" | tr ' ' ' '
  zi loaded 
      echo 
  print -P "%F{122}■ zi times ❯ Statistics on plugin load times, sorted in order of loading. -s – use seconds instead of milliseconds. -m – show plugin loading moments and -a both."
    printf '\033[1;42m%-*s\033[0m\n' "${COLUMNS:-$(tput cols || true)}" "▓▒░ ★ » $1" | tr ' ' ' '
  zi times 
  print -P "\n%F{122}■ BIN%f%b"
    printf '\033[1;42m%-*s\033[0m\n' "${COLUMNS:-$(tput cols || true)}" "▓▒░ ★ » $1" | tr ' ' ' '
  ls -l $ZPFX/bin/ | awk '{print $(NF-2),$(NF-1),$NF}'
}



#❯■■■■■■■■■❯zi❮NVM❯■■■■■■■■■❯
zi ice wait"1" lucid
zi light lukechilds/zsh-nvm
export NVM_AUTO_USE=true  



#❯■■■■■■■■■❯ecosystem/plugins❮Bin Gem Node❯■■■■■■■■■❯
  zi ice as'null' sbin'bin/*'
  zi light z-shell/zsh-diff-so-fancy



#❯■■■■■■■■■❯annex❮link Bin❯■■■■■■■■■❯
# The ice-modifier lbin'' provided by the annex creates links for binaries and scripts.
# The optional preceding ! flag means creating a soft link instead of a hard link.
zi light z-shell/z-a-linkbin
 zi ice from'gh-r' as'program' \
    lbin'**fzf -> myfzf'
  zi load junegunn/fzf



#❯■■■■■■■■■❯meta-plugins❮❯■■■■■■■■■❯
#                                           @annexes: bin-gem-node, readurl, patch-dl, rust, default-ice, unscope 
#                                           @console-tools: dircolors-material (package), fd, bat, hexyl, hyperfine, exa, ripgrep, tig 
#zi for z-shell/z-a-meta-plugins  @annexes  
zi light-mode compile'functions/.*za-*~*.zwc' for z-shell/z-a-meta-plugins @annexes @console-tools \
  atinit'Z_A_USECOMP=1' compile'functions/.*ev*~*.zwc' z-shell/z-a-eval
#zi for z-shell/z-a-meta-plugins @annexes @console-tools \
#skip'rust' @annexes 

#zi light-mode for @annexes \
#  skip'rust' @annexes \

#zi light-mode for @console-tools \ 
#  skip'vivid exa tig' @console-tools



#❯■■■■■■■■■❯rust❮cargo❯Compiling❮■■■■■■■■■❯
zi for z-shell/z-a-meta-plugins @annexes @console-tools @rust-utils 
zi id-as"rust" wait=1 as=null sbin="bin/*" lucid rustup nocompile \
atload="[[ ! -f ${ZI[COMPLETIONS_DIR]}/_cargo ]] && zi creinstall -q rust; \
export CARGO_HOME=\$PWD; export RUSTUP_HOME=\$PWD/rustup" for \
zi light z-shell/z-a-rust

#❯■■■■■■■■■❯cargo❮package❯■■■■■■■■■❯
zi ice rustup cargo'!atuin'
zi load z-shell/0
eval "$(atuin init zsh)"



#❯■■■■■■■■■❯turbo❮❯■■■■■■■■■❯
#❯wait	      Laden Sie 0 Sekunden (genau etwa 5 ms) nach der Eingabeaufforderung ( Turbomodus ).
#❯lucid	      Schalten Sie die untergeordneten Meldungen stumm (" Loaded {name of the plugin}").
#❯light-mode	Laden Sie das Plugin ein lightModus. 1 .
#❯atpull'…'	  Nach der Aktualisierung des Plugins ausführen – der Befehl im Ice installiert alle neuen Vervollständigungen.
#❯atinit'…'	  Führen Sie den Code aus, bevor Sie das Plugin laden.
#❯atload'…'  	Führen Sie den Code aus, nachdem Sie das Plugin geladen haben.
#❯zicompinit	Ist gleich autoload compinit; compinit.
#❯zicdreplay	Ausführen compdef …Aufrufe durch Plugins.
#zi-turbo '0a' for \
#  binary sbin'bin/*' \
#    z-shell/nb \
#  binary from"gh-r" sbin \
#    ajeetdsouza/zoxide \
#  has'lsd' atinit'AUTOCD=1' \
#    z-shell/zsh-lsd \
#  has'zoxide' \
#    z-shell/zsh-zoxide \
#  atinit'YSU_MESSAGE_POSITION=after' \
#    MichaelAquilina/zsh-you-should-use
zi wait lucid for \
    atinit:"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        "z-shell/fast-syntax-highlighting" \
        "z-shell/F-Sy-H" \
           OMZP::colored-man-pages \
    blockf atpull:"zi creinstall zsh-users/zsh-completions"\
        "zsh-users/zsh-completions" \
    atload:"!_zsh_autosuggest_start" \
        "zsh-users/zsh-autosuggestions" \
        "le0me55i/zsh-extract" \
        "z-shell/nb" 



#❯■■■■■■■■■❯ice❮eismodifikator❯■■■■■■■■■❯
#❯atclone Führen Sie den Befehl nach dem Klonen im Plugin-Verzeichnis aus, z. B zi ice atclone"echo cloned". Läuft auch nach dem Herunterladen des Snippets.
#❯atpull 	 Führen Sie den Befehl nach der Aktualisierung (nur für neue Commits) im Verzeichnis des Plugins aus.
#           Wenn es mit „!“ beginnt dann wird der Befehl vorher ausgeführt mv& cpEis und davor git pulloder svn update. Ansonsten wird nachgelaufen mv& cpEis. 
#           Benutzen Sie die atpull'%atclone'wiederholen atcloneEismodifikator.
#❯atinit 	Führen Sie den Befehl nach der Verzeichniseinrichtung (Klonen, Überprüfen usw.) des Plugins/Snippets aus, bevor Sie es laden.
#❯atload 	Führen Sie nach dem Laden den angegebenen Befehl im Verzeichnis des Plugins aus. Kann mit Snippets verwendet werden. Dem übergebenen Code kann Folgendes vorangestellt werden !, zu untersuchen (bei Verwendung load, nicht light). 
zi ice atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
  atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
  as'program' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zi light pyenv/pyenv

zi ice lucid wait as'program' from"gh-r" has'fzf'
zi load denisidoro/navi
[ -d "$HOME/.export/share/navi/cheats/" ] && export NAVI=$HOME/.export/share/navd/cheats/
#eval "$(navi widget zsh)" - create navi-widget for bindkey Ctrl + G > 45-bindkey.zsh

#zi ice from'gh-r' as'program' mv'vivid* vivid' sbin'**/vivid(.exe|) -> vivid'
#zi light @sharkdp/vivid
#export LS_COLORS="$(vivid generate snazzy)"

zi ice lucid wait as'program' has'bat' pick'src/*'
zi light eth-p/bat-extras



#❯■■■■■■■■■❯OH-MY-ZSH❮snippets❯■■■■■■■■■❯
#zi-turbo '0a' lucid is-snippet for has'svn' svn multisrc'$array' pick'/dev/null' \
#  atinit'HISTFILE=${HOME}/.cache/zi/zsh-history; COMPLETION_WAITING_DOTS=true' OMZ::lib
#zi-turbo '0b' lucid is-snippet for \
#  atload"unalias grv g" OMZP::git
  zi is-snippet wait lucid for \
    atload"unalias grv g" \
 OMZP::{git,sudo,extract,pip,copypath,copyfile,gh,dirhistory,copybuffer,mosh,nmap,web-search} \
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





