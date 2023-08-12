#!/bin/bash
  printf "%s\n" \
    '
   @@@@@@@   @@@@@@  @@@@@@@ @@@@@@@@ @@@ @@@      @@@@@@@@  @@@@@@
   @@!  @@@ @@!  @@@   @@!   @@!      @@! @@!      @@!      !@@    
   @!@  !@! @!@  !@!   @!!   @!!!:!   !!@ @!!      @!!!:!    !@@!! 
   !!:  !!! !!:  !!!   !!:   !!:      !!: !!:      !!:          !:!
   :: :  :   : :. :     :     :       :   : ::.: : : :: ::: ::.: : 
      '
#------------------------------------------------------------------------------#
# SETTINGS
#------------------------------------------------------------------------------#
DOTDIR=".dotfiles"
BACKUPDIR="$HOME/.dotfiles.backup"
#------------------------------------------------------------------------------#
# check Download or UPDATE
#------------------------------------------------------------------------------#
alias dot='git --git-dir=$HOME/$DOTDIR --work-tree=$HOME $@'
dot() { git --git-dir="$DOTDIR" --work-tree="$HOME" "$@"; }

#if [ -d "$DOTDIR" ]; then
#echo "> updating dotfiles..."
#  dot pull 
#  exit 0
#fi
#------------------------------------------------------------------------------#
# Backup already existing dotfiles
#------------------------------------------------------------------------------#
DOTGITFILES=($(dot ls-tree --full-tree -r --name-only HEAD | awk '{print $NF}'))

for f in "${DOTGITFILES[@]}"; do
  # File at root ==> back up file
  if [[ $(basename "$f") = "$f" ]]; then
    [[ -f "$HOME/$f" ]] && mkdir -p "$BACKUPDIR" && mv "$HOME/$f" "$BACKUPDIR" && echo "> Backing up: $f ==> $BACKUPDIR/$f"
  else
    d=${f%%/*}
    if [[ -d "$HOME/$d" ]]; then
      [[ -d "$BACKUPDIR/$d" ]] && rm -rf "$BACKUPDIR/$d"
      mkdir -p "$BACKUPDIR" && mv "$HOME/$d" "$BACKUPDIR" && echo "> Backing up: $d/ ==> $BACKUPDIR/$d/"
    fi
  fi
done
[ -d "$BACKUPDIR" ] && echo "> Success! The following dotfiles have been installed to $BACKUPDIR"
#------------------------------------------------------------------------------#
# DOWNLOAD dotfiles
#------------------------------------------------------------------------------#
echo "> downloading dotfiles..."
dot clone --bare https://github.com/qgrep/zsh-dotfile-bare $HOME/$DOTDIR
#dot clone --bare --recurse-submodules https://github.com/qgrep/zsh-dotfile-bare.git "$HOME/.dotfiles"
#------------------------------------------------------------------------------#
# INSTALL dotfiles
#------------------------------------------------------------------------------#
[[ -f $ZDOTDIR/.zshrc ]] && . $ZDOTDIR/.zshrc
dot checkout
dot submodule --quiet init
dot submodule --quiet update
dot config status.showUntrackedFiles no


#------------------------------------------------------------------------------#
# DEV
#------------------------------------------------------------------------------#
  # if [ ! -d "$HOME/.oh-my-zsh" ]; then
  #    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  #     ZSHPACKAGES=("https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k \
  #                   https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
  #                   https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
  #                   https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions")
  #fi
