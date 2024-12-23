# shellcheck shell=bash

function copilot_shell_suggest() {
    # `-t shell` is the default anyway.
    ghcs "$@"
}
alias '??'='copilot_shell_suggest'

# Function to handle Git command suggestions
function copilot_git_suggest() {
    ghcs -t git "$@"
}
alias 'git?'='copilot_git_suggest'

# Function to handle GitHub CLI command suggestions
function copilot_gh_suggest() {
    ghcs -t gh "$@"
}
alias 'gh?'='copilot_gh_suggest'
