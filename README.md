# Dotfiles

## Einführung

- [x] Die Dotfiles in diesem Repository werden mithilfe eines **Bare-Git-Repositorys** installiert. Diese Methode verwendet keine Symlinks (wie die meisten anderen Dotfile-Repositorys).

- [x] Nach der Installation sind alle Dotfiles physisch in Ihrem
  Home-Ordner vorhanden, Sie unterliegen jedoch weiterhin der 
  vollständigen Versionskontrolle.

## Installation

```bash
curl -Lks https://github.com/qgrep/zsh-dotfile-bare/blob/main/.zsh/deploy.sh | /bin/bash
```

## Bare-Git-Repository handling

- Set git status to hide untracked files
  
  ```bash
  dot config --local status.showUntrackedFiles no
  ```

- Add files & commit
  
  ```bash
  dot status
  
  # add .zshenv
  dot add $HOME/.zsh/README.md
  dot commit -m "repo init"
  
  dot remote add origin https://github.com/qgrep/zsh-dotfile-bare.git
  dot push origin main
  ```