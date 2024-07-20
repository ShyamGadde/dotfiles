#!/usr/bin/env bash

HOMEBREW_CASKS=(
    visual-studio-code
    font-jetbrains-mono-nerd-font
    font-monocraft
)

for pkg in "${HOMEBREW_CASKS[@]}"; do
    if ! brew list --cask "$pkg" &> /dev/null; then
        echo "Installing $pkg..."
        brew install --cask "$pkg"
    else
        echo "$pkg is already installed"
    fi
done
