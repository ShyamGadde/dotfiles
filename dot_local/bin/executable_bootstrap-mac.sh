#!/usr/bin/env bash

HOMEBREW_CASKS=(
    visual-studio-code
    font-jetbrains-mono-nerd-font
    font-monocraft
)

brew install --cask "${HOMEBREW_CASKS[@]}"
