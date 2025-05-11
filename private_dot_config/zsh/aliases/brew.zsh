# shellcheck shell=bash

alias ba='brew autoremove'
alias bcn='brew cleanup'
alias bi='brew install'
alias bl='brew list'
alias bo='brew outdated'
alias bu='brew update'
alias buo='brew update && brew outdated'
alias bup='brew upgrade'
alias bupgc='brew upgrade --greedy && brew cleanup'
alias buu='buo && bup'
alias buug='buo && bupgc'
alias buz='brew uninstall --zap'

alias bci='brew info --cask'
alias bcin='brew install --cask'
alias bcl='brew list --cask'
alias bco='brew outdated --cask'
alias bcrin='brew reinstall --cask'
alias bcuo='brew update && brew outdated --cask'
alias bcup='brew upgrade --cask'
alias bcupc='brew upgrade --cask && brew cleanup'

alias bfl='brew list --formula'
alias bfuo='brew update && brew outdated --formula'
alias bfup='brew upgrade --formula'

alias bbi='brew bundle install --global'
alias bbic='bu && brew bundle install --global --cleanup && bup'

alias bsl='brew services list'
alias bsoff='brew services stop'
alias bsoffa='bsoff --all'
alias bson='brew services start'
alias bsona='bson --all'
alias bsr='brew services run'
alias bsra='bsr --all'

function brews() {
    local formulae="$(brew leaves | xargs brew deps --installed --for-each)"
    local casks="$(brew list --cask 2>/dev/null)"

    local blue="$(tput setaf 4)"
    local bold="$(tput bold)"
    local off="$(tput sgr0)"

    echo "${blue}==>${off} ${bold}Formulae${off}"
    echo "${formulae}" | sed "s/^\(.*\):\(.*\)$/\1${blue}\2${off}/"
    echo "\n${blue}==>${off} ${bold}Casks${off}\n${casks}"
}
