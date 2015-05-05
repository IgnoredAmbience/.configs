SVN_EDITOR=vim
GIT_EDITOR=vim
PRINTER=DoCIPPMono
CUPS_USER=tw1509

case $TERM in
  xterm*)
    # Set xterm title to user@host: pwd
    # Set shell prompt to \a \$
    # ASCII bell for xmobar's alerter, \$ is default prompt
    # \[ \] disable character counting for enclosed section
    #PS1='\[]0;\u@\h: \w\a\]\$ '
    PS1='\[\a\]\$ '
    ;;
  *)
    ;;
esac

alias ls="ls -F --color"
alias l="ls"
alias ll="l -l"
alias la="l -A"
alias sicstus="rlwrap sicstus"
alias cwb="rlwrap cwb"
alias git?="git status"

PATH=~/bin:~/.gem/ruby/2.2.0/bin:~/.cabal/bin:$PATH

export PATH HOME TERM SVN_EDITOR GIT_EDITOR PRINTER CUPS_USER
