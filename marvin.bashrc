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
alias prgrm='cd ~/Documents/Programming/'
alias rch='cd ~/Documents/Research/'
alias py='cd ~/Documents/Programming/Python/'

# some convenience aliases for editing configs
alias bashrc=$dotfileDir/marvin.bashrc
alias bash_profile=$dotfileDir/marvin.bash_profile