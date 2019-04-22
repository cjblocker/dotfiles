#!/bin/bash

# download git autocompletions
wget -O git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

# setup soft links 
source ./.bash_profile

for file in '.bash_profile' '.bashrc' '.gitconfig'; do
    # Delete old symlink, or backup old file
    test -h $HOME/$file && rm -f $HOME/$file || mv $HOME/$file $dotfileDir/backup$file
    # link to our configs in the home directory
    ln -s $dotfileDir/$file $HOME/$file
done 

# ssh config has different naming pattern...
test -h $HOME/.ssh/config && rm -f $HOME/.ssh/config || mv $HOME/.ssh/config $dotfileDir/backup.ssh-config
ln -s $dotfileDir/.ssh-config $HOME/.ssh/config
