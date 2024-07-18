# shellcheck shell=zsh

# Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'j' down-line-or-history
# bindkey -M menuselect 'k' up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char

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
bindkey -M emacs '^[[H' beginning-of-line
bindkey -M viins '^[[H' beginning-of-line
bindkey -M vicmd '^[[H' beginning-of-line

# [End] - Go to end of line
bindkey -M emacs '^[[F' end-of-line
bindkey -M viins '^[[F' end-of-line
bindkey -M vicmd '^[[F' end-of-line

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
