# shellcheck shell=bash

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
