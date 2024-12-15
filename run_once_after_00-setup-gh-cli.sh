#!/usr/bin/env bash

gh auth login

# Download extensions:
gh extension install github/gh-copilot
gh extension install yuler/gh-download
gh extension install meiji163/gh-notify

echo "**Run 'ssh -T git@github.com'**"
