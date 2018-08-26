# tcharron-dotfiles

A Git repository designed to track my dotfiles.

## Prerequisites

* Oh My Zsh
* virtualenvwrapper
* nvm
* bullet train ZSH plugin

## Dotfiles

* .agignore
* .bash_profile
* .gitconfig
* .tmux.conf
* .tmux.conf.local
* .vimrc
* .vimrc.bundles
* .zshrc


## Installation

`./init.sh`. 
This will remove whatever is in the place of the dotfiles, and create symbolic
links to the version controlled ones. This way whenever they are updated
the updates will be tracked in Git.
