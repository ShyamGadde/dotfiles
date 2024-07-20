#!/usr/bin/env bash

gh auth login

# Download extensions:
gh extension install github/gh-copilot
gh extension install yuler/gh-download

echo "**Run 'ssh -T git@github.com'**"
