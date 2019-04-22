#!/bin/bash
# Setup my enviromnent via ssh on a new remote
cat ~/.ssh/id_rsa.pub | ssh $1 'mkdir -p .ssh && cat >> .ssh/authorized_keys'
ssh $1 'mkdir -p bin && mkdir -p Workspace && cd Workspace && git clone https://github.com/cjblocker/dotfiles.git && cd dotfiles && ./install.sh'