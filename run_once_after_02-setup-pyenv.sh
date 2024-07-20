#!/usr/bin/env bash

curl https://pyenv.run | bash

# Initialize pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

pyenv install -v "$(pyenv latest -k 3)"
pyenv global system
