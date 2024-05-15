#!/bin/sh

cd $(chezmoi source-path)
git remote remove origin
git remote add origin git@github.com:ShyamGadde/dotfiles.git
git fetch
git branch -u origin/main
