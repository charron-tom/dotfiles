#!/bin/bash

# Find all the dotfiles and install them
for file in `find . -type f -name ".*"`
do
    # Remove the current one if it already exists
    echo "Installing $dst."
    ln -s ${PWD}/$file $dst
done
