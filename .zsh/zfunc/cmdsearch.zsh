function cmdsearch() {
  BUFFER=$(the-way search --stdout --languages="sh")
  print -z $BUFFER
}
zle -N cmdsearch
stty -ixon
bindkey  '^F' cmdsearch