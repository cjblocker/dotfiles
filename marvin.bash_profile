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