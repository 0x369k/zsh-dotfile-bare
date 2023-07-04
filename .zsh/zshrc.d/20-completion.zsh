
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#073642,bg=#839496,bold,underline"
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bold,underline,standout"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=100


zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh_cache



# >‑‑‑‑‑‑ { zstyle } ‑‑‑‑‑‑> |
# aliasexpand   CTRL+A
zle -C alias-expension complete-word _generic
bindkey '^a' alias-expension
zstyle ':completion:alias-expension:*' completer _expand_alias

# ~~~ Abschluss ohne Berücksichtigung der Groß-/Kleinschreibung ~~~
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Fuzzy-Matching von Vervollständigungen
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Hübsche Abschlüsse
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' rehash true

# menügesteuerte Vervollständigung
zstyle ':completion:*' menu select

# Farbvervollständigung für derzeitige Dinge 
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#~~~ Better SSH/Rsync/SCP Autocomplete ~~~ 
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# ~~~ fzf -tab gänge configs ~~~
# disable sort when completing `git checkout`
  #zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
  #zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
  zstyle ':fzf-tab:*' switch-group ',' '.'

##################################################################ENV'###################TEST#####################

zstyle ':completion:*' completer _complete _approximate _extensions _expand_alias   # Define completers
#zstyle ':completion:*:descriptions' format "- %d -"
#zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''                                               # Required for completion to be in good groups (named after the tags)
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' verbose yes
zstyle ':completion:*' rehash yes
zstyle -e ':completion:*:approximate:*' max-errors \
          'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'

zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters               # Array completion element sorting.


zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'




zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

# ~~~ Group matches and describe. ~~~
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'


# https://thevaluable.dev/zsh-completion-guide-examples/
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}                       # ls
zstyle ':completion:*' file-list all                                                # cd

# ~~~ complete manual by their section ~~~
zstyle ':completion:*:manuals'                      separate-sections true
zstyle ':completion:*:manuals.*'                    insert-sections   true
zstyle ':completion:*:man:*'                        menu yes select

# ~~~ Persistent rehash ~~~
zstyle ':completion:*' rehash true


# ~~~ color ~~~
#zstyle ':completion:*:options' list-colors '=(#b)(--[^ ]#)(*)=30;1;220;1=32;1;216' # 
#zstyle ':completion:*' list-colors '=(#b)(--[^ ]#)(*)=38;5;220;1=38;5;216'          
#zstyle ':completion:*:parameters'  list-colors '=*=32'                             # ParameterGrün
#zstyle ':completion:*:builtins' list-colors '=*=1;38;5;142'                        # builtins gelb
#zstyle ':completion:*:commands' list-colors '=*=1;31'                              #commands in bolded red
#zstyle ':completion:*:aliases' list-colors '=*=2;38;5;128'                         # alias purple
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")'


# ~~~ fzf-tab-completion ~~~
# basic file preview for ls (you can replace with something more sophisticated than head)
zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'

# preview when completing env vars (note: only works for localed variables)
# eval twice, first to unescape the string, second to expand the $variable
zstyle ':completion::*:(-command-|-parameter-|-brace-parameter-|local|unset|expand):*' fzf-completion-opts --preview='eval eval echo {1}'

# preview a `git status` when completing git add
zstyle ':completion::*:git::git,add,*' fzf-completion-opts --preview='git -c color.status=always status --short'

# if other subcommand to git is given, show a git diff or git log
zstyle ':completion::*:git::*,[a-z]*' fzf-completion-opts --preview='
eval set -- {+1}
for arg in "$@"; do
    { git diff --color=always -- "$arg" | git log --color=always "$arg" } 2>/dev/null
done'
