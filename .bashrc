#!/bin/bash
#
# .bashrc
# this is run each time a shell is created
# it should contain bash specific stuff
# like aliases and functions
#
# Cameron Blocker <cameronjblocker@gmail.com>


source $dotfileDir/.git-prompt.sh


# some aliases that should work on any system
alias hgrep='history|grep'
alias ducks='sudo du -cksh * | sort -n | head -50'


if [ -x "$(which hostname)" ]; then
      case "$(hostname -s)" in
        Marvin)
          # source specific paths and vars for Marvin (macOS laptop)
          source $dotfileDir/marvin.bashrc
          ;;
        ir*)
          # source specific paths and vars for ir research machines
          source $dotfileDir/ir.bashrc
	        ;;
        iv*) # same as above
          # source specific paths and vars for ir research machines
          source $dotfileDir/ir.bashrc
          ;;
      esac
fi
