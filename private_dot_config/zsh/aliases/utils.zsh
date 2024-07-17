# shellcheck shell=bash

alias ..='cd ..'

alias vim='nvim'

# Chezmoi
alias cm='chezmoi'
alias cmu='chezmoi re-add'

# Verbose and interactive
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

alias edit-grub="sudo \$EDITOR /etc/default/grub"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias lg='lazygit'
alias lzd='lazydocker'

alias tarnow='tar -acf '
alias untar='tar -zxvf '

alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

alias hw='hwinfo --short' # Hardware Info

alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl" # Recent installed packages
alias big="expac -H M '%m\t%n' | sort -h | nl"                                # Sort installed packages according to size in MB

alias myip='curl http://ipecho.net/plain; echo'
alias tb='nc termbin.com 9999'   # Upload to termbin. E.g., <command> | tb
alias jctl="journalctl -p 3 -xb" # Show journalctl logs with priority 3 and above
# alias helpme='cht.sh --shell'

function lc() {
    $SHELL -c "cd ~/Workspace/leetcode; nvim lc"
}

function zshrc() {
    if command -v chezmoi > /dev/null; then
        EDITOR='chezmoi edit'
    fi
    $SHELL -c "cd $ZDOTDIR; ${EDITOR:-nvim} ."
}

function vimrc() {
    if command -v chezmoi > /dev/null; then
        EDITOR='chezmoi edit'
    fi
    $SHELL -c "cd $XDG_CONFIG_HOME/nvim; ${EDITOR:-nvim} ."
}

function hyprrc() {
    if command -v chezmoi > /dev/null; then
        EDITOR='chezmoi edit'
    fi
    $SHELL -c "cd $XDG_CONFIG_HOME/hypr; ${EDITOR:-nvim} ."
}

function mcd() {
    mkdir -p "$1" && cd "$1" || return
}

# Convert filenames and folder names to kebab-case
rename_to_kebab_case() {
    for f in *; do
        # new_name=$(echo "$f" | sed -e 's/ /-/g' -e 's/_/-/g' | tr A-Z a-z)
        new_name=$(echo "$f" | sed -e 's/ /-/g' -e 's/_/-/g' | tr '[:upper:]' '[:lower:]')
        if [ "$f" != "$new_name" ]; then
            mv -i "$f" "$new_name"
        fi
    done
}
alias kebabify='rename_to_kebab_case'
