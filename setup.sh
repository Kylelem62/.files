#!/bin/bash

function install {
    if [ ! -f dotlist ]
    then
        echo "~/.files/dotlist file not found, creating one for you."
        echo "Please edit this file to include the dotfiles you want to manage."
        echo "Then run this script again."
        echo "bashrc" >> dotlist
        echo "bash_profile" >> dotlist
        exit 1
    fi

    # Function to check for source and prepend if not found

    function check_source {
        source_line="source ~/.files/$1"
        dotfile=".$1"
        if ! grep -Fxq "$source_line" ~/$dotfile
        then
            echo "Prepending source line to $dotfile"
            echo "$source_line" | cat - ~/$dotfile > temp && mv temp ~/$dotfile
        else
            echo "Source line already exists in $dotfile"
        fi
    }

    # Check for dotfiles that don't have includes to our .files/bashrc etc.
    # Only include files that are in the dotlist file

    for dotfile in $(cat dotlist) 
    do
        # Check to make sure the dotfile exists, if not, create it and warn the user
        if [ ! -f ~/".$dotfile" ]
        then
            echo "Creating $dotfile"
            touch ~/".$dotfile"
        fi
        #Check to make sure we have a matching file in our .files directory
        if [ ! -f $dotfile ]
        then
            echo "No matching file found for $dotfile in .files directory."
            echo "Please create one and run this script again."
            exit 1
        fi
        check_source $dotfile
    done

    echo "Dotfile setup complete."
}

if [ "$1" == "remove" ]
then
    echo "Removing source lines from dotfiles"
    for dotfile in $(cat dotlist)
    do
        source_line="source ~/.files/$dotfile"
        if grep -Fxq "$source_line" ~/.$dotfile
        then
            echo "Removing source line from ~/.$dotfile"
            sed -i "/source ~\/.files\/$dotfile/d" ~/.$dotfile | cat -
        fi
    done
    echo "Dotfile removal complete."
    exit 0
fi

if [ "$1" == "install" ]
then
    install
    exit 0
fi

echo "Usage: setup.sh [update|remove]"
echo "    install - Includes the .files/bashrc etc. in your dotfiles based on the dotlist file."
echo "             If the dotlist file doesn't exist, it will be created for you."
echo "    remove - Removes the source lines from your dotfiles."
exit 1
