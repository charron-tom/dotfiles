#!/bin/bash

install(){
    # Remove the current one if it already exists
    rm -rf ~/$1
    echo "Installing ~/$1."
    ln -s ${PWD}/$1 ~/$1
}

# Find all the dotfiles and install them
for file in `find . -type f -name ".*"`
do
    install $file
done
