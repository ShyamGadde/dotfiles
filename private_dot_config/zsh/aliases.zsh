# Color
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='ugrep --color=auto'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'
alias ip='ip -color=auto'

# Pacman
alias cleanup-cache="sudo pacman -Scc"                   # Cleanup pacman cache
alias cleanup-orphans="pacman -Qdtq | sudo pacman -Rn -" # Cleanup pacman orphans
alias rmpkg="sudo pacman -Rs"                            # Remove package and its dependencies
alias gitpkg='pacman -Q | grep -i "\-git"'               # List -git packages
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
# alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

# Replace ls with exa
# Using function here instead of plain alias to allow for completions
function ls()  { eza --color=always --group-directories-first --icons "$@"; }
function la()  { eza --color=always --group-directories-first --icons -a "$@"; }
function ll()  { eza --color=always --group-directories-first --icons -l "$@"; }
function lla() { eza --color=always --group-directories-first --icons -al "$@"; }
function lt()  { eza --color=always --group-directories-first --icons -T "$@"; }
function l.()  { eza --color=always --group-directories-first --icons -ald .* "$@"; }

# Define completions for above functions
compdef ls=eza
compdef la=eza
compdef ll=eza
compdef lla=eza
compdef lt=eza
compdef l.=eza

# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Global aliases
alias -g B='|& bat'
alias -g G='|& grep'
alias -g H='|& head'
alias -g S='| sort'
alias -g T='|& tail'
alias -g X='| xargs'

# Misc
alias ..='cd ..'

alias vim='nvim'

alias lc="$SHELL -c \"cd ~/Workspace/leetcode; nvim lc\""

alias cm='chezmoi'
alias cmu='chezmoi re-add'

alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

alias edit-grub="sudo $EDITOR /etc/default/grub"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias lg='lazygit'
alias lzd='lazydocker'

alias tarnow='tar -acf '
alias untar='tar -zxvf '

alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias hw='hwinfo --short'                                                     # Hardware Info
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl" # Recent installed packages
alias big="expac -H M '%m\t%n' | sort -h | nl"                                # Sort installed packages according to size in MB
alias myip='curl http://ipecho.net/plain; echo'
alias tb='nc termbin.com 9999'   # Upload to termbin. E.g., <command> | tb
alias jctl="journalctl -p 3 -xb" # Show journalctl logs with priority 3 and above
# alias helpme='cht.sh --shell'

alias update-mirrors="sudo reflector --verbose --protocol https --age 24 --fastest 15 --save /etc/pacman.d/mirrorlist && bat /etc/pacman.d/mirrorlist" # Get the fastest mirrors

function zshrc() {
	if command -v chezmoi > /dev/null; then
		EDITOR='chezmoi edit'
	fi
	zsh -c "cd $ZDOTDIR; ${EDITOR:-nvim} ."
}

function vimrc() {
	if command -v chezmoi > /dev/null; then
		EDITOR='chezmoi edit'
	fi
	zsh -c "cd $XDG_CONFIG_HOME/nvim; ${EDITOR:-nvim} ."
}

function hyprrc() {
	if command -v chezmoi > /dev/null; then
		EDITOR='chezmoi edit'
	fi
	zsh -c "cd $XDG_CONFIG_HOME/hypr; ${EDITOR:-nvim} ."
}

function mcd() {
	mkdir -p "$1" && cd "$1"
}

# Convert filenames and folder names to kebab-case
rename_to_kebab_case() {
	for f in *; do
		new_name=$(echo "$f" | sed -e 's/ /-/g' -e 's/_/-/g' | tr A-Z a-z)
		if [ "$f" != "$new_name" ]; then
			mv -i "$f" "$new_name"
		fi
	done
}
alias kebabify='rename_to_kebab_case'

# Fun
alias hack='docker run --rm -it bcbcarl/hollywood'
alias please='sudo'
