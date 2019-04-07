#!/bin/bash
#
# .bashrc
# this is run each time a shell is created
# it should contain bash specific stuff
# like aliases and functions
#
# Cameron Blocker <cameronjblocker@gmail.com>

# In random situations, like using scp?, .bash_profile
# is not sourced before .bashrc and so we wrap this
# in an if to keep it from erroring
if [[ $dotfileDir ]]; then
  source $dotfileDir/.git-prompt.sh
fi

# Allow us to exit ssh gracefully on reboot
if [[ $SSH_CLIENT ]]; then
  alias reboot='shutdown --reboot 0 > /dev/null ; exit'
fi


# some aliases that should work on any system
alias sudo='sudo ' # to allow aliases after sudo
alias hgrep='history|grep'
export GLOBIGNORE=".:.."
alias ducks='du -cksh * | sort -h | tail -n 50' #override for color on marvin
alias cd='cd ' # allow aliases after cd
alias ...='../..'
alias ll="ls -lA" # marvin overrides l with o

if [[ $dotfileDir ]] && [ -x "$(which hostname)" ]; then
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
        Apollo)
          source $dotfileDir/apollo.bashrc
          ;;	  
      esac
fi
