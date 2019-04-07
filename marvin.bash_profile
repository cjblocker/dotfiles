#!/bin/bash
#
# marvin.bash_profile
# this is the parts of .bash_profile that are
# specific to my laptop macOS marvin
#
# Cameron Blocker <cameronjblocker@gmail.com>

export BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

# ARM Embedded Toolchain
export PATH="$PATH:/usr/local/gcc_arm/gcc-arm-none-eabi-7-2017-q4-major/bin/"

test -r /sw/bin/init.sh && . /sw/bin/init.sh

# Lunchy (A launchctl wrapper gem)
   LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
   if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
     . $LUNCHY_DIR/lunchy-completion.bash
   fi

# Nim Lang
export PATH=/Users/cblocker/.nimble/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Their should be a better place than this than my bin folder...
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cblocker/bin/google-cloud-sdk/path.bash.inc' ]; then . '/Users/cblocker/bin/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/cblocker/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/cblocker/bin/google-cloud-sdk/completion.bash.inc'; fi

# virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Workspace
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh