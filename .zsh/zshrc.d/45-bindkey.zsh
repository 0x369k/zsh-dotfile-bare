# >‑‑‑‑‑‑ { bindkey } ‑‑‑‑‑‑> |
bindkey "^[[1;5D" beginning-of-line       # CTRL + <
bindkey "^[OH"    beginning-of-line       # HOME
bindkey "^[[1;5C" end-of-line             # CTRL + >
bindkey "^[OF"    end-of-line             # END
bindkey "^[[1;3D" backward-word           # ALT  + <
bindkey "^[[1;3C" forward-word            # ALT  + >
bindkey "^[[3~"   delete-char             # DELETE
bindkey "^[[A"    history-search-backward # up   arrow
bindkey "^[[B"    history-search-forward  # down arrow
bindkey "^[[2~"   overwrite-mode          # Insert

bindkey '^[h'     backward-word           # Alt + hd
bindkey '^[l'     forward-word            # Alt + l
bindkey '^[j'     backward-char           # Alt + j
bindkey '^[k'     forward-char            # Alt + k
 
bindkey '^[y'     backward-delete-word    # Alt + y
bindkey '^[o'     delete-word             # Alt + o
bindkey '^[i'     delete-char             # Alt + i

bindkey '^[^H'    backward-delete-word    # Ctrl + h
bindkey '^[^L'    delete-word             # Ctrl + l
bindkey '^[y'     redo                    # Alt + y
bindkey '^[z'     undo                    # Alt + z
bindkey '^L'      clear-screen            # Ctrl + l

# showkey -a  
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line