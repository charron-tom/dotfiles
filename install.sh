#!/usr/bin/env zsh


############
# Homebrew #
############
if ! command -v brew &> /dev/null; then
  echo ">>> Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
  brew install ag amethyst cmake colima ctags docker docker-compose docker-credential-helper dog htop git-lfs git-sizer glow gping k9s jpeg jq minikube mysql nmap node nvm onefetch postgresql@17 pre-commit pstree pyenv telnet tmux zsh-autosuggestions zsh-syntax-highlighting
  brew cleanup
else
  echo ">>> Homebrew already installed."
fi
echo


#########
# iTerm #
#########
ITERM_INSTALL_URL="https://iterm2.com/downloads/stable/latest"
ITERM_INSTALL_FILE="install.zip"
if [ ! -d "/Applications/iTerm.app" ]; then
    echo ">>> Installing iTerm2."
    curl -L "$ITERM_INSTALL_URL" -o "$ITERM_INSTALL_FILE"
    unzip "$ITERM_INSTALL_FILE"
    sudo cp -R iTerm.app /Applications
    rm "$ITERM_INSTALL_FILE"
else
    echo ">>> iTerm already installed."
fi
echo


#############
# oh-my-zsh #
#############
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo ">>> Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo ">>> oh-my-zsh already installed."
fi
echo

if [ ! -d "$SANDBOX/dotfiles/oh-my-zsh/plugins/zsh-autosuggestions" ]; then
  echo ">>> Installing zsh-syntax-highlighting."
  git clone "https://github.com/zsh-users/zsh-autosuggestions" "$SANDBOX/dotfiles/oh-my-zsh/plugins/zsh-autosuggestions"
else
  echo ">>> zsh-autosuggestions already installed."
fi
echo

if [ ! -d "$SANDBOX/dotfiles/oh-my-zsh/plugins/zsh-syntax-highlighting" ]; then
  echo ">>> Installing zsh-syntax-highlighting."
  git clone "https://github.com/zsh-users/zsh-syntax-highlighting" "$SANDBOX/dotfiles/oh-my-zsh/plugins/zsh-syntax-highlighting"
else
  echo ">>> zsh-syntax-highlighting already installed."
fi
echo



###########
# folders #
###########
if [ ! -d "$HOME/Sandbox" ]; then
  echo ">>> Creating directory: $HOME/Sandbox"
fi

if [ ! -d "$HOME/Workspace" ]; then
  echo ">>> Creating directory: $HOME/Workspace"
fi


############
# vim-plug #
############
VIM_PLUG="$HOME/.vim/autoload/plug.vim"
VIM_PLUG_INSTALL_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
if [ ! -f "$VIM_PLUG" ]; then
  echo ">>> Installing vim-plug"
  curl -fLo "$VIM_PLUG" --create-dirs "$VIM_PLUG_INSTALL_URL"
else
  echo ">>> vim-plug already installed."
fi
echo


#########
# fonts #
#########
NERD_FONT_VERSION="v3.3.0"
FONT="0xProto"
if [ ! -f "$HOME/Library/Fonts/$FONT""NerdFont-Regular.ttf"  ]; then
  echo ">>> Installing $FONT font."
  curl -L "https://github.com/ryanoasis/nerd-fonts/releases/download/$NERD_FONT_VERSION/$FONT.zip" -o "$FONT.zip"
  unzip "$FONT.zip" "$FONT*.ttf" -d "$HOME/Library/Fonts"
  rm "$FONT.zip"
else
  echo ">>> $FONT font already installed."
fi
echo


############
# dotfiles #
############
for file in `find . -type f -name ".*" -maxdepth 1 | sed -e 's,^\./,,' | sort`; do
    # Remove the current one if it already exists
    dotfile="$HOME/$file"
    if [ ! -f "$dotfile" ]; then
      echo ">>> Installing $dotfile."
      ln -s ${PWD}/$file $dotfile
    else
      echo ">>> $dotfile already installed."
    fi
done
echo


###########
# scripts #
###########
for file in `ls scripts | sort`; do
    # Remove the current one if it already exists
    script="/usr/local/bin/$file"
    if [ ! -f "$script" ]; then
      echo ">>> Installing $script."
      ln -s ${PWD}/scripts/$file $script
    else
      echo ">>> $script already installed."
    fi
done
echo
