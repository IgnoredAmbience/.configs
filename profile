PATH=$HOME/bin:$HOME/ic/pintos/src/utils:/usr/bin/core_perl:/usr/local/jdk-1.7.0/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games

SVN_EDITOR=vim
GIT_EDITOR=vim
PRINTER=ICTMono-2s

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

alias git="hub"
alias ls="ls -F --color"
alias l="ls"
alias ll="l -l"
alias la="l -A"
alias sicstus="rlwrap sicstus"
alias cwb="rlwrap cwb"
alias git?="git status"

export PATH HOME TERM SVN_EDITOR GIT_EDITOR
