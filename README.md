# tcharron-dotfiles

A Git repository designed to track my dotfiles. This will remove whatever
is in the place of the dotfiles, and create symbolic links to the version
controlled ones. This way whenever they are updated the updates will be
tracked in Git.

## Installation

Install Homebrew
`$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)`

Install ohmyzsh
`$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)`

Install vim-plug
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

Install dotfiles
`./init.sh`

Install Homebrew packages
`brew install ag amethyst awscli ctags k9s jq minikube mysql nmap node nvm parquet-tools psql pstree pyenv pyenv-virtualenv tmux`

[optional] Install Python packages
`pip install black flake8 pg_activity`
