#!/bin/bash

###############################################################################
DOTFILES=".bash_profile .bashrc .gitconfig .vimrc .Xdefaults .xinitrc"
###############################################################################

DOTFILES_DIR_NAME=dotfiles
DOTFILES_BACKUP_DIR_NAME=dotfiles_backup

HOME_DIR=`echo ~`
DOTFILES_PATH=$HOME_DIR/$DOTFILES_DIR_NAME
NOW=`date +"%Y%m%d_%H%M"`
DOTFILES_BACKUP_DIR=$DOTFILES_PATH/$DOTFILES_BACKUP_DIR_NAME_$NOW

createBackupDir()
{
    # Create backup directory
    echo "Creating dotfiles backup directory: $1"
    mkdir -p $1
}

backupFile()
{
    local originalFile=$1
    local backupFile=$2

    # If original file exists, move it to backup dir
    if [ -e $originalFile ]; then
        # File exists
        # Backup the file
        echo "Moving $originalFile to $backupFile"
        mv $originalFile $backupFile
    else
        # File not found
        echo "File $originalFile not found - skipping backup"
    fi
}

createLink()
{
    local linkName=$1
    local linkTarget=$2

    # Check if target exists
    if [ -e $linkTarget ]; then
        # File exists
        # create symlink
        echo "Creating symlink from $linkName to $linkTarget"
        ln -s $linkTarget $linkName
    else
        # File not found
        echo "File $linkTarget not found - skipping symlink creation"
    fi 
}

processDotfiles()
{
    local dotfiles="$@"

    for file in $dotfiles; do
        # Prepare paths
        originalFile="$HOME_DIR/$file"
        backupFile="$DOTFILES_BACKUP_DIR/$file"
        newFile="$DOTFILES_PATH/$file"
        
        backupFile $originalFile $backupFile
        createLink $originalFile $newFile
    done
}

processVimConfigFile()
{
    local dir=".vim/$1"
    local file="$2"

    # Ensure directory exists
    mkdir -p $HOME_DIR/$dir

    # Backup original file, if exists
    backupFile $HOME_DIR/$dir/$file $DOTFILES_BACKUP_DIR/$dir/$file

    # Create link to new config file
    createLink $HOME_DIR/$dir/$file $DOTFILES_PATH/$dir/$file
}

configureVim()
{
    processVimConfigFile "colors" "solarized.vim"
}

createBackupDir $DOTFILES_BACKUP_DIR
processDotfiles $DOTFILES
configureVim

