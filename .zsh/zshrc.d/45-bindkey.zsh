#❯note:
# showkey -a 
# bindkey -l                           will give you a list of existing keymap names.
# zle -al                              lists all registered zle commands
#
#        ^ = Ctrl
#       ^[ = Alt
# \e or \E = Escape
# bindkey "^Q^L" $WIDGET
#
#❯■■■■■■■■■❯to register a new widget❮❯■■■■■■■■■❯
#autoload -U $WIDGET                   autoload -U ( -Uist für den Benutzer) findet eine Datei in Ihrem $fpathgenannt $WIDGETund stellt es zur Verfügung zle
#zle -N $WIDGET                        zle -N ( -Nist für neu) macht das Widget für die Befehlszeile verfügbar
#bindkey $KEY_SEQUENCE $WIDGET
#
#❯■■■■■■■■■❯to register a new widget❮example fzf❯■■■■■■■■■❯
#❯❮Ctrl + f❯fzf❮tty❯■■■■■■■■■❯ Zle redirects stdin from /dev/null so you need to redirect it back from the tty.
#fzf-widget() {
#  fzf <"$TTY"
#}
#❯❮Ctrl + f❯fzf❮commandline❯■■■■■■■■■❯ that it’ll print the selection to stdout. inserted into the commandline 
fzf-widget() {
  local selection
  selection=$(fzf <"$TTY") || return
  LBUFFER+="$selection"
}

zle -N fzf-widget
bindkey '^f' fzf-widget



bindkey "^[[3~"   delete-char             # DELETE
bindkey "^[[2~"   overwrite-mode          # Insert
bindkey '^[h'     backward-word           # Alt + h
bindkey '^[l'     forward-word            # Alt + l
bindkey '^[j'     backward-char           # Alt + j
bindkey '^[k'     forward-char            # Alt + k
bindkey '^[o'     delete-word             # Alt + o
bindkey '^[i'     delete-char             # Alt + i
bindkey '^[^H'    backward-word           # Ctrl + h



bindkey -s '^s'   '^Qsudo '               # Ctrl + s 

#alias-expension 
zle -C alias-expension complete-word _generic
bindkey '^a^e' alias-expension

#navi
navi-widget() {
  navi <"$TTY"
}
zle -N navi-widget
bindkey '^g' navi-widget


#❯■■■■■■■■■❮ctrl + l❯insert-last-command-output❮commandline❯■■■■■■■■■❯get output from last command 
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}

zle -N insert-last-command-output
bindkey "^L" insert-last-command-output


#❯■■■■■■■■■❮ctrl + t❯Tetris❮game❯■■■■■■■■■❯
autoload -Uz tetris
zle -N tetris
bindkey '^t^e' tetris


