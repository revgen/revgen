#!/bin/bash
MYENV_REPO=https://raw.githubusercontent.com/revgen/myenv

wget -O ~/.gitconfig    "${MYENV_REPO}/master/home/.gitconfig"
wget -O ~/.pylintrc     "${MYENV_REPO}/master/home/.pylintrc"
wget -O ~/.vimrc        "${MYENV_REPO}/master/home/.vimrc"
