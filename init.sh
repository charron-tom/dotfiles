#!/bin/bash


installDotFile(){
    # Remove the current one if it already exists
    rm -rf ~/$1

    echo "Installing ~/$1."
    # Add a symbolic link to this Git repo
    ln -s ${PWD}/$1 ~/$1
}

# Find all the dotfiles and install them
for f in `find . -type f -name ".*"`
do
    installDotFile $f
done
