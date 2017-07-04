set +H
shopt -s extglob

SVN_EDITOR=vim
GIT_EDITOR=vim

case $- in
  *i*)
    source /usr/share/git/completion/git-prompt.sh
    # Set xterm title to user@host: pwd
    # ASCII bell for xmobar's alerter, \$ is default prompt
    # \[ \] disable character counting for enclosed section
    PS1='\[\e]2;\u@\h:\w\a\a\]\u@\h:\W$(__git_ps1 " (%s)")\$ '
    #PS1='\[\a\]\$ '
    ;;
  *)
    ;;
esac

alias ls="ls --color"
alias l="ls -F"
alias ll="l -l"
alias la="l -A"
alias sicstus="rlwrap sicstus"
alias cwb="rlwrap cwb"
alias git?="git status"
alias ocamldebug="rlwrap ocamldebug"
alias ocaml="rlwrap ocaml"

export GEM_HOME=~/.gem
export GOPATH=~/go
PATH=~/bin:~/.local/bin:$GOPATH/bin:$GEM_HOME/ruby/2.4.0/bin:~/.cabal/bin:$PATH

PGHOST=db.doc.ic.ac.uk
PGUSER=tw1509
PGDATABASE=rr_u
export PGHOST PGUSER PGDATABASE

export CUPS_USER=tw1509
export PRINTER=ICTMonoXerox

export PATH HOME TERM SVN_EDITOR GIT_EDITOR

export MAKEFLAGS="-j4"

complete -C somafm somafm

# added by travis gem
[ -f /home/thomas/.travis/travis.sh ] && source /home/thomas/.travis/travis.sh

# OPAM configuration
. /home/thomas/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
