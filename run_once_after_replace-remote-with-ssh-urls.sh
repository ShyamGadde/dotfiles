#!/usr/bin/env bash

cd "$(chezmoi source-path)" || exit 1
git remote remove origin
git remote add origin git@github.com:ShyamGadde/dotfiles.git
git fetch
git branch -u origin/main
