# shellcheck shell=bash

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='ugrep --color=auto'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'
alias ip='ip -color=auto'

alias cat='bat --style header --style snip --style changes --style header'

# Replace ls with exa
# INFO: Functions are used here instead of plain aliases to allow for completions.
for cmd in ls la ll lt l. lla; do
    case $cmd in
        ls) args="" ;;
        la) args="-a" ;;
        ll) args="-l" ;;
        lt) args="-T" ;;
        l.) args="-ald .*" ;;
        lla) args="-al" ;;
    esac
    eval "function $cmd() { eza --color=always --group-directories-first --icons $args \"\$@\"; }"

    # Define completions for above functions.
    compdef $cmd=eza
done
