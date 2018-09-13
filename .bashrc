#!/bin/bash
#
# .bashrc
# this is run each time a shell is created
# it should contain bash specific stuff
# like aliases and functions
#
# Cameron Blocker <cameronjblocker@gmail.com>


source $dotfileDir/.git-prompt.sh



alias hgrep='history|grep'


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
      esac
fi
