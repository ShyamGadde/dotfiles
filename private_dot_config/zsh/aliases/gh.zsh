# shellcheck shell=bash

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
