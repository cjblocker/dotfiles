alias ~fessler='/n/ironwood/y/fessler'
set FINDARG ="-type f -not -regex '.*\.swp' -not -regex '.*\.tex'"
alias lookup="find /n/ironwood/y/fessler/l/tex/biblio/b2 $FINDARG | /n/ironwood/y/fessler/l/src/script/bib/b,grep \!* | more"
alias lookieee="find /n/ironwood/y/fessler/l/tex/biblio/jour/ /n/ironwood/y/fessler/l/tex/biblio/b2 -type f -not -regex '.*\.swp' -not -regex '.*\.tex' | /n/ironwood/y/fessler/l/src/script/bib/b,grep \!* | more"
alias @u='/n/ironwood/y/fessler/l/src/script/bib/@u'


export A=a:$A
