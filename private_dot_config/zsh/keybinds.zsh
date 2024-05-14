# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' down-line-or-history
bindkey -M menuselect 'k' up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

#bindkey '^R' history-incremental-pattern-search-backward # Ctrl + R (Prefer fzf over this)

# TODO: Figure out what the heck this is
typeset -g -A key
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# [Backspace] - delete backward
bindkey -M emacs '^?' backward-delete-char
bindkey -M viins '^?' backward-delete-char

# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
    bindkey -M emacs "${terminfo[kdch1]}" delete-char
    bindkey -M viins "${terminfo[kdch1]}" delete-char
else
    bindkey -M emacs "^[[3~" delete-char
    bindkey -M viins "^[[3~" delete-char

    bindkey -M emacs "^[3;5~" delete-char
    bindkey -M viins "^[3;5~" delete-char
fi

# [Home] - Go to beginning of line
if [[ -n "${terminfo[khome]}" ]]; then
    bindkey -M emacs "${terminfo[khome]}" beginning-of-line
    bindkey -M viins "${terminfo[khome]}" beginning-of-line
    bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi

# [End] - Go to end of line
if [[ -n "${terminfo[kend]}" ]]; then
    bindkey -M emacs "${terminfo[kend]}" end-of-line
    bindkey -M viins "${terminfo[kend]}" end-of-line
    bindkey -M vicmd "${terminfo[kend]}" end-of-line
fi

# [PageUp] - Up a line of history
if [[ -n "${terminfo[kpp]}" ]]; then
    bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
    bindkey -M viins "${terminfo[kpp]}" up-line-or-history
    bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
fi

# [PageDown] - Down a line of history
if [[ -n "${terminfo[knp]}" ]]; then
    bindkey -M emacs "${terminfo[knp]}" down-line-or-history
    bindkey -M viins "${terminfo[knp]}" down-line-or-history
    bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
fi

# [Shift-Tab] - move through the completion menu backwards
if [[ -n "${terminfo[kcbt]}" ]]; then
    bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
    bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
    bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

# [Control-Left] - go back a word
if [[ -n "${terminfo[kLFT5]}" ]]; then
    bindkey -M emacs "${terminfo[kLFT5]}" backward-word
    bindkey -M viins "${terminfo[kLFT5]}" backward-word
fi

# [Control-Right] - go forward a word
if [[ -n "${terminfo[kRIT5]}" ]]; then
    bindkey -M emacs "${terminfo[kRIT5]}" forward-word
    bindkey -M viins "${terminfo[kRIT5]}" forward-word
fi

# [Control-Backspace] - delete word backward
bindkey -M viins '^H' backward-kill-word

# History substring search
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M viins "${terminfo[kcuu1]}" history-substring-search-up
bindkey -M viins "${terminfo[kcud1]}" history-substring-search-down
