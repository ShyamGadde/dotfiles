# shellcheck shell=bash

function copilot_shell_suggest() {
    gh copilot suggest -t shell "$@"
}
alias '??'='copilot_shell_suggest'

# Function to handle Git command suggestions
function copilot_git_suggest() {
    gh copilot suggest -t git "$@"
}
alias 'git?'='copilot_git_suggest'

# Function to handle GitHub CLI command suggestions
function copilot_gh_suggest() {
    gh copilot suggest -t gh "$@"
}
alias 'gh?'='copilot_gh_suggest'
