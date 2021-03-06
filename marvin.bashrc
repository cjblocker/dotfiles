#!/bin/bash
#
# marvin.bashrc
# this is the parts of .bashrc that are
# specific to my laptop macOS marvin
# i.e. these are marvin specific aliases
#
# Cameron Blocker <cameronjblocker@gmail.com>



# alias ack='ack-5.16'
alias compile11='g++ -Wall -g -std=c++11 *.cpp -o'
alias nasm='nasm425'

# shortcut aliases
alias work='cd ~/Workspace'
alias rch='cd ~/Workspace/research/'
alias ipy='ipython'

# some convenience aliases for editing configs
alias bashrc=$dotfileDir/marvin.bashrc
alias bash_profile=$dotfileDir/marvin.bash_profile
alias subl="subl "

alias ducks="paste -d'  ' <(du -cksh * | cut -f1) <(CLICOLOR_FORCE=1 ls -1d * && echo total) | sort -h | tail -n 50"

alias ll="ls -oA"

alias term='open -a /Applications/Utilities/Terminal.app .'


# virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Workspace
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh