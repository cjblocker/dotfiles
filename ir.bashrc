
alias prgrm='cd ~/Documents/Programming/'
alias rch='cd ~/Documents/Research/'
alias py='cd ~/Documents/Programming/Python/'
alias ls='ls --color'
alias bashrc=$dotfileDir/ir.bashrc

# Fessler recommended aliases
# alias ~fessler='/n/ironwood/y/fessler'
export FINDARG="-type f -not -regex '.*\.swp' -not -regex '.*\.tex'"
alias lookup="find /n/ironwood/y/fessler/l/tex/biblio/b2 $FINDARG | /n/ironwood/y/fessler/l/src/script/bib/b,grep \!* | more"
alias lookieee="find /n/ironwood/y/fessler/l/tex/biblio/jour/ /n/ironwood/y/fessler/l/tex/biblio/b2 -type f -not -regex '.*\.swp' -not -regex '.*\.tex' | /n/ironwood/y/fessler/l/src/script/bib/b,grep \!* | more"
alias @u='/n/ironwood/y/fessler/l/src/script/bib/@u'

