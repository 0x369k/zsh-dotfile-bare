#!/bin/bash
git clone --bare https://github.com/qgrep/zsh-dotfiles.git $HOME/.zsh

 git init --bare ~/.dotfiles
$ alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
$ config config status.showUntrackedFiles no


git init --bare ~/.dotfiles

#You can then manage your dotfiles with the created alias. 
#If you are using Bash and would like bash completion for this alias,
#simply install bash-complete-aliasAUR, then add the alias and the following line to your ~/.bashrc
    echo -e '\n#dotfiles completion\ncomplete -F _complete_alias dotfiles' >> ~/.bashrc


#    GIT_DIR Hier befinden sich Ihre Repository-Daten . Hier speichert Git alle Daten, und zwar in Dateien und 
#    Dateiformaten, die für Sie in 99 % der Fälle undurchsichtig sind. Hier werden beispielsweise alle Versionen Ihrer README-Dateien gespeichert, Ihr 
#    Stash gespeichert oder der aktuelle Zweig registriert. Wenn Sie ein Repository initiieren oder klonen, gehört es standardmäßig Ihnen .gitVerzeichnis.

#    GIT_WORK_TREE Hier befinden sich die Dateien, mit denen Sie arbeiten . Beispielsweise befindet sich dort die README-Datei, die Ihr Editor oder Ihre IDE öffnen kann, damit 
#    Sie sie bearbeiten und ändern können, oder Ihr Compiler findet die Dateien. Standardmäßig ist es das übergeordnete Verzeichnis, in dem die .gitVerzeichnis ist. 
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout

#You'll want to tell Git to ignore untracked files when 
#running `git status`, since this repository will only manage certain hand-picked files
# in your home directory:
dotfiles config --local status.showUntrackedFiles no


alias zshdot='/usr/bin/git --git-dir=$HOME/.zsh/ --work-tree=$HOME'


for i in $( find $$HOME -maxdepth 1 -mindepth 1 ); do
    HOMEFILE="$HOME/$( basename $i )"
    if [[ -e $HOMEFILE ]] ; then
        if [[ "$i" != "$( readlink $HOMEFILE)" ]] ; then
            echo $HOMEFILE{,.bak-$(date +%Y%m%d)}
        fi
    fi
    echo $i $HOME/
done




