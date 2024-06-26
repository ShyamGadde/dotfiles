function tmux_attach() {
    local session
    session=$(tmux ls | fzf --height 40% --layout=reverse --border | awk -F: '{print $1}')
    if [ -n "$session" ]; then
        tmux attach -t "$session"
    fi
}
alias ta='tmux_attach'
