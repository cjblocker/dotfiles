#!/bin/bash
#
# .bash_profile
# this is run once for each login
# and contains environment variables
# that don't need to be redefined in child shells
#
# Cameron Blocker <cameronjblocker@gmail.com>

# Personal PATH extensions
export PATH=$HOME/bin:$PATH

# Setup Editor config (PATH to subl needs to be set first)
# Use sublime text if available and not ssh, otherwise vim
if [ -z "$SSH_CLIENT" ] && [ -x "$(which subl)" ]; then
  export EDITOR='subl -n -w '
else
  export EDITOR='vim '
fi
export GIT_EDITOR=$EDITOR
# a check that doesn't depend on the environment VVV
# SSH_IP=$(who am i | perl -ne '/.*\((.+)\)/ && print "$1";')


# Add colors to terminal
# for Mac
export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagaced
# for Linux
# alias ls='ls --color'
# di-directory, fi-file, ln-symlink, pi-fifo, so-socket, bd-block, cd-character, 
# or-orphan symlink, mi-non-existed file pointed to by orphan, ex-executable
export LS_COLORS='di=36:fi=0:ln=35:pi=31:so=31:bd=31:cd=31:or=47;35:mi=101:ex=32'
# 0  - white (files)
# 31 - red (i.e. this is abnormal)
# 32 - green (executables)
# 35 - purple (symlinks)
# 36 - cyan (directores)
# 5  - blinking (broken) but was annoying so...
# 101 - light red bg (broken)
# full list at http://linux-sxs.org/housekeeping/lscolors.html


# Style Prompt (could go in bashrc since it depends on .git-prompt)
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
export PROMPT_COMMAND='__git_ps1 "\!-[\h:\W]" "-> "'
# export PS1='\!-[\h:\W]$(__git_ps1)->'


##### The code below determines our dotfile dir. I would put it in its own
##### script in the dotfiles directory, but then I wouldn't be able to use
##### it to find where the dotfile directory is...
# copied from https://stackoverflow.com/questions/24112727/relative-paths-based-on-file-location-instead-of-current-working-directory
# it doesn't need to go in bashrc since we'll only use it once.
# Helper function.
rreadlink() ( # execute function in a *subshell* to localize the effect of `cd`, ...

  local target=$1 fname targetDir readlinkexe=$(command -v readlink) CDPATH= 

  # Since we'll be using `command` below for a predictable execution
  # environment, we make sure that it has its original meaning.
  { \unalias command; \unset -f command; } &>/dev/null

  while :; do # Resolve potential symlinks until the ultimate target is found.
      [[ -L $target || -e $target ]] || { command printf '%s\n' "$FUNCNAME: ERROR: '$target' does not exist." >&2; return 1; }
      command cd "$(command dirname -- "$target")" # Change to target dir; necessary for correct resolution of target path.
      fname=$(command basename -- "$target") # Extract filename.
      [[ $fname == '/' ]] && fname='' # !! curiously, `basename /` returns '/'
      if [[ -L $fname ]]; then
        # Extract [next] target path, which is defined
        # relative to the symlink's own directory.
        if [[ -n $readlinkexe ]]; then # Use `readlink`.
          target=$("$readlinkexe" -- "$fname")
        else # `readlink` utility not available.
          # Parse `ls -l` output, which, unfortunately, is the only POSIX-compliant 
          # way to determine a symlink's target. Hypothetically, this can break with
          # filenames containig literal ' -> ' and embedded newlines.
          target=$(command ls -l -- "$fname")
          target=${target#* -> }
        fi
        continue # Resolve [next] symlink target.
      fi
      break # Ultimate target reached.
  done
  targetDir=$(command pwd -P) # Get canonical dir. path
  # Output the ultimate target's canonical path.
  # Note that we manually resolve paths ending in /. and /.. to make sure we
  # have a normalized path.
  if [[ $fname == '.' ]]; then
    command printf '%s\n' "${targetDir%/}"
  elif  [[ $fname == '..' ]]; then
    # Caveat: something like /var/.. will resolve to /private (assuming
    # /var@ -> /private/var), i.e. the '..' is applied AFTER canonicalization.
    command printf '%s\n' "$(command dirname -- "${targetDir}")"
  else
    command printf '%s\n' "${targetDir%/}/$fname"
  fi
)

# Determine ultimate script dir. using the helper function.
# Note that the helper function returns a canonical path.
export dotfileDir=$(dirname -- "$(rreadlink "$BASH_SOURCE")")

### This goes last so it can use the above environment
# -e for exist instead of -f for regular file since it can be symlink
if [ -e ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -x "$(which hostname)" ]; then
      case "$(hostname -s)" in
        Marvin)
          # source specific paths and vars for Marvin (macOS laptop)
          source $dotfileDir/marvin.bash_profile
          ;;
        ir*)
          # source specific paths and vars for ir research machines
          echo "hello ir"
          ;;
      esac
fi

### End .bash_profile ### (anything below this was auto appended)
