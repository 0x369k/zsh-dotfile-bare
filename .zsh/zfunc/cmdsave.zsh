function cmdsave() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "the-way cmd `printf %q "$PREV"`"
}
zle -N cmdsave
stty -ixon
bindkey  '^S' cmdsave