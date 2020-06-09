#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)

# vim
ln -s ${BASEDIR}/.vimrc ~/.vimrc

# zsh
ln -s ${BASEDIR}/devcontainer/.zshrc ~/.zshrc

# git
ln -s ${BASEDIR}/.gitconfig ~/.gitconfig
