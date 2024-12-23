# shellcheck shell=bash

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='ugrep --color=auto'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'
alias ip='ip -color=auto'

alias cat='bat --style header --style snip --style changes --style header'

# Replace ls with exa
typeset -A cmd_args=(
    [ls]=""
    [la]="-a"
    [ll]="-l"
    [lt]="-T"
    [l.]="-ald .*"
    [lla]="-al"
)

# shellcheck disable=SC2296
for cmd in "${(k)cmd_args[@]}"; do
    # INFO: Functions are used here instead of plain aliases to allow for completions.
    eval "function $cmd() { eza --color=always --group-directories-first --icons ${cmd_args[$cmd]} \"\$@\"; }"

    # Define completions for above functions.
    compdef "$cmd"=eza
done
