ta() {
	tmux attach -t "$(tmux ls | fzf --height 40% --layout=reverse --border | awk -F: '{print $1}')"
}
