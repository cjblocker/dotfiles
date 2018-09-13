# dotfiles

Here contains the only bash scripting I think I will ever do, for setting up my environment easily on different machines.

 - `.bash_profile` This file contains environment variable that only need to be set once and only runs at the beginning of a login shell. Set evironment variables here. Other files named `hostname.bash_profile` contain evironment variables for specific hosts.
 - `.bashrc` This file contains the bash specific definitions that gets run in every shell (technically only non-login shells, but we source this in .bash_profile). The shell will inherit the environment variables from .bash_profile so they don't need to be set here again. Put here bash aliases and bash functions that you will need. Similarly to above `hostname.bashrc` contains host specific definitions.
 - `.ssh-config` corresponds to `~/.ssh/config` and contains ssh configs, default usernames and host aliases.
 - `.gitconfig` is the user's git config. Contains email, github username, mergetools, editor etc. This has higher precedence than the system wide git config but less precedence than repo config files or git environment variables.
 - `.git-prompt.sh` a downloaded script that puts git branch information in the shell prompt.