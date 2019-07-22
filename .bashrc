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
  # git autocompletions
  source $dotfileDir/git-completion.bash
fi

# Allow us to exit ssh gracefully on reboot
if [[ $SSH_CLIENT ]]; then
  alias reboot='shutdown --reboot 0 > /dev/null ; exit'
fi

bold="\[\e[0;1m\]"
underline="\[\e[0;4m\]"
invert="\[\e[0;7m\]"
purple="\[\e[0;35m\]"
cyan="\[\e[0;36m\]"
reset="\[\e[0m\]"

function _venv_info { # https://stackoverflow.com/a/30541526
    [[ -n "$VIRTUAL_ENV" ]] && echo "($purple${VIRTUAL_ENV##*/}$reset)"
}

# some aliases that should work on any system
alias sudo='sudo ' # to allow aliases after sudo
alias hgrep='history|grep'
export GLOBIGNORE=".:.."
alias ducks='du -cksh * | sort -h | tail -n 50' #override for color on marvin
alias cd='cd ' # allow aliases after cd
alias ...='../..'
alias ll="ls -lA" # marvin overrides l with o


function ch {
  # No arguments returns us to our root host
  if [[ $# -eq 0 ]]; then
    if [[ $SSH_CLIENT ]]; then
      exit 5 # flag to recurse out of ssh
    else
      return 1 # no-op; must provide host if already local
    fi
  fi
  
  # - as an argument pops the host stack
  if [ $1 == "-" ]; then
    if [[ $SSH_CLIENT ]]; then
      exit
    else
      return 1
    fi
  fi

  # ssh into the host, while preserving current directory
  ssh $1 -t "cd ${PWD/#$HOME/\$HOME};exec \$SHELL -l"

  # Catch intent to recurse to our root host
  if [[ $? -eq 5 ]] && [[ $SSH_CLIENT ]]; then
    exit 5 # continue to recurse out of ssh
  else
    return 0
  fi
}


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
