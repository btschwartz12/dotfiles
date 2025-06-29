source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color always'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_R_OPTS="
    --preview 'echo{}'
    --preview-window down:3:hidden:wrap
    --layout reverse
    --bind 'ctrl-/:toggle-preview'
    --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
    --color header:italic
    --header 'Press CTRL-Y to copy command into clipboard'
"