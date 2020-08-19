#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/.vimrc ~/.vimrc

# zsh
ln -s ${BASEDIR}/.zshrc ~/.zshrc

# git
ln -s ${BASEDIR}/.gitconfig ~/.gitconfig

# Tmux
ln -s ${BASEDIR}/.tmuxp ~/.tmuxp
ln -s ${BASEDIR}/.tmux.conf ~/.tmux.conf




git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
pip3 install tmuxp black isort flake8
