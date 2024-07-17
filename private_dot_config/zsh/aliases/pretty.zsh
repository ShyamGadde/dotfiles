# shellcheck shell=bash

# Color
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='ugrep --color=auto'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'
alias ip='ip -color=auto'

alias cat='bat --style header --style snip --style changes --style header'

# Replace ls with exa
# INFO: Using function here instead of plain alias to allow for completions
function ls() { eza --color=always --group-directories-first --icons "$@"; }
function la() { eza --color=always --group-directories-first --icons -a "$@"; }
function ll() { eza --color=always --group-directories-first --icons -l "$@"; }
function lt() { eza --color=always --group-directories-first --icons -T "$@"; }
function l.() { eza --color=always --group-directories-first --icons -ald .* "$@"; }
function lla() { eza --color=always --group-directories-first --icons -al "$@"; }

# Define completions for above functions
compdef ls=eza
compdef la=eza
compdef ll=eza
compdef lla=eza
compdef lt=eza
compdef l.=eza
