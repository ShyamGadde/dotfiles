#!/usr/bin/env bash

PACKAGES=(
    base-devel
    bash-completion
    bat
    bitwarden-cli
    btop
    eza
    fd
    fzf
    git
    github-cli
    jq
    lazygit
    man-db
    man-pages
    neovim
    ripgrep
    starship
    tealdeer
    tmux
    ugrep
    zoxide
    zsh-autosuggestions
    zsh-completions
    zsh-history-substring-search
)

sudo pacman -Syu
sudo pacman -S --noconfirm --needed "${PACKAGES[@]}"
