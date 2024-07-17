# shellcheck shell=bash

# Pacman
alias cleanup-cache="sudo pacman -Scc"                   # Cleanup pacman cache
alias cleanup-orphans="pacman -Qdtq | sudo pacman -Rn -" # Cleanup pacman orphans
alias rmpkg="sudo pacman -Rs"                            # Remove package and its dependencies
alias gitpkg='pacman -Q | grep -i "\-git"'               # List -git packages
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
# alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

alias update-mirrors="sudo reflector --verbose --protocol https --age 24 --fastest 15 --save /etc/pacman.d/mirrorlist && bat /etc/pacman.d/mirrorlist" # Get the fastest mirrors
