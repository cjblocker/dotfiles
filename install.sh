#!/bin/bash
source ./.bash_profile

# TODO remove old configs before creating new ones
# link to our configs in the home directory
ln -s $dotfileDir/.bash_profile $HOME/.bash_profile
ln -s $dotfileDir/.bashrc $HOME/.bashrc

ln -s $dotfileDir/.gitconfig $HOME/.gitconfig
ln -s $dotfileDir/.ssh-config $HOME/.ssh/config