#!/usr/bin/env bash

PACKAGES=(
    atuin
    base-devel
    bash-completion
    bat
    bitwarden-cli
    btop
    eza
    fd
    fzf
    git
    git-delta
    git-lfs
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
)

sudo pacman -Syu
sudo pacman -S --noconfirm --needed "${PACKAGES[@]}"
