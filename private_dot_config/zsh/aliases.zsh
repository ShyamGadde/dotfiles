# shellcheck shell=bash

##################
### Arch Linux ###
##################

if grep -q "Arch Linux" /etc/os-release; then
    # For Pacman
    alias cleanup-cache="sudo pacman -Scc"                   # Cleanup pacman cache
    alias cleanup-orphans="pacman -Qdtq | sudo pacman -Rn -" # Cleanup pacman orphans
    alias rmpkg="sudo pacman -Rs"                            # Remove package and its dependencies
    alias gitpkg='pacman -Q | grep -i "\-git"'               # List -git packages
    alias fixpacman="sudo rm /var/lib/pacman/db.lck"
    alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl" # Recently Installed Packages
    alias big="expac -H M '%m\t%n' | sort -h | nl"                                # Sort installed packages according to size in MB
    # alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

    [ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

    alias update-mirrors="sudo reflector --verbose --protocol https --age 24 --fastest 15 --save /etc/pacman.d/mirrorlist && bat /etc/pacman.d/mirrorlist" # Get the fastest mirrors
fi

######################
### Docker Compose ###
######################

alias dco='docker-compose'
alias dcb='docker-compose build'
alias dcr='docker-compose run'
alias dcup='docker-compose up'
alias dcupd='docker-compose up -d'
alias dcupb='docker-compose up --build'
alias dcupbd='docker-compose up --build -d'
alias dcdown='docker-compose down'
alias dce='docker-compose exec'

###########
### Fun ###
###########

alias hack='docker run --rm -it bcbcarl/hollywood'
alias please='sudo'

##########################
### GitHub Copilot CLI ###
##########################

if gh extension list | grep -q 'github/gh-copilot'; then
    eval "$(gh copilot alias -- zsh)"

    copilot_shell_suggest() {
        ghcs -t shell "$@"
    }
    alias '??'='copilot_shell_suggest'

    # Function to handle Git command suggestions
    copilot_git_suggest() {
        ghcs -t git "$@"
    }
    alias 'git?'='copilot_git_suggest'

    # Function to handle GitHub CLI command suggestions
    copilot_gh_suggest() {
        ghcs -t gh "$@"
    }
    alias 'gh?'='copilot_gh_suggest'
fi

###########
### Git ###
###########

alias gst='git status'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gb='git branch'
alias gs='git switch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gp='git pull --rebase --autostash'
alias gP='git push'
alias gl='git log'
alias glo='git log --oneline'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'
# Similar to `gunwip` but recursive "Unwips" all recent `--wip--` commits not just the last one
function gunwipall() {
    local _commit

    _commit=$(git log --grep='--wip--' --invert-grep --max-count=1 --format=format:%H)

    # Check if a commit without "--wip--" was found and it's not the same as HEAD
    if [[ "$_commit" != "$(git rev-parse HEAD)" ]]; then
        git reset "$_commit" || return 1
    fi
}

# Lazygit
alias lazygit='env TERM=screen-256color lazygit' # BUG: This a temporary workaround for Truecolors not working properly for delta in lazygit inside tmux
function lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)" || exit
        rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

##############
### Global ###
##############

alias -g B='|& bat'
alias -g G='|& grep'
alias -g H='|& head'
alias -g S='| sort'
alias -g T='|& tail'
alias -g X='| xargs'

##############
### Pretty ###
##############

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

############
### Tmux ###
############

function tmux_attach() {
    local session
    session=$(tmux ls | fzf --height 40% | awk -F: '{print $1}')
    if [ -n "$session" ]; then
        tmux attach -t "$session"
    fi
}
alias ta='tmux_attach'

#################
### Utilities ###
#################

alias ..='cd ..'
alias c='clear'
alias e='exit'
alias vim='nvim'

# Chezmoi
alias cm='chezmoi'
alias cmu='chezmoi re-add'
alias cme='chezmoi edit'

# Verbose and interactive
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

alias edit-grub="sudo \$EDITOR /etc/default/grub"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias lzd='lazydocker'

alias tarnow='tar -acf '
alias untar='tar -zxvf '

alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

alias hw='hwinfo --short' # Hardware Info

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
    $SHELL -c "cd $ZDOTDIR && ${EDITOR:-nvim} ."
}

function vimrc() {
    if command -v chezmoi > /dev/null; then
        EDITOR='chezmoi edit'
    fi
    $SHELL -c "cd $XDG_CONFIG_HOME/nvim && ${EDITOR:-nvim} ."
}

function hyprrc() {
    if command -v chezmoi > /dev/null; then
        EDITOR='chezmoi edit'
    fi
    $SHELL -c "cd $XDG_CONFIG_HOME/hypr && ${EDITOR:-nvim} ."
}

function mcd() {
    mkdir -p "$1" && cd "$1" || return
}

function list_oldfiles() {
    # Get the oldfiles list from Neovim.
    # shellcheck disable=SC2207
    local oldfiles=($(nvim -u NONE --headless +'lua io.write(table.concat(vim.v.oldfiles, "\n") .. "\n")' +qa))
    # Filter invalid paths or files not found.
    local valid_files=()
    for file in "${oldfiles[@]}"; do
        if [[ -f "$file" && "$file" != /tmp/* ]]; then
            valid_files+=("$file")
        fi
    done

    # Use fzf to select from valid files.
    # shellcheck disable=SC2207
    local files=($(printf "%s\n" "${valid_files[@]}" | grep -v '\[.*' | fzf --multi --height=50%))

    # Open selected files in Neovim
    [[ ${#files[@]} -gt 0 ]] && nvim "${files[@]}"
}
alias lof='list_oldfiles'

# Convert filenames and folder names in the current directory to kebab-case
function rename_to_kebab_case() {
    for f in *; do
        new_name=$(echo "$f" | sed -e 's/ /-/g' -e 's/_/-/g' | tr '[:upper:]' '[:lower:]')
        if [ "$f" != "$new_name" ]; then
            mv -i "$f" "$new_name"
        fi
    done
}
alias kebabify='rename_to_kebab_case'
