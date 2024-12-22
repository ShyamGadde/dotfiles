# shellcheck shell=bash

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
