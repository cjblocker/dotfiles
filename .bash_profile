source ~/Documents/Programming/dotfiles/.git-prompt.sh

alias hgrep='history|grep'
alias ack='ack-5.16'
alias compile11='g++ -Wall -g -std=c++11 *.cpp -o'
alias nasm='nasm425'

# shortcut aliases
alias prgrm='cd ~/Documents/Programming/'
alias rch='cd ~/Documents/Research/'
alias py='cd ~/Documents/Programming/Python/'

export EDITOR='subl -n -w '

export BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

# Personal PATH extensions
export PATH=/Users/cblocker/bin:$PATH

# Add colors to terminal
export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagaced

# Style Prompt
export PS1='\!-[\h:\W]$(__git_ps1)->'

test -r /sw/bin/init.sh && . /sw/bin/init.sh

