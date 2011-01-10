# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/usr/local/jdk-1.7.0/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

DIST_SERVER_MIRRORSERVICE=ftp://ftp.mirrorservice.org/pub/OpenBSD
DIST_SERVER_BYTEMARK=ftp://mirror.bytemark.co.uk/pub/OpenBSD
DIST_SERVER=$DIST_SERVER_MIRRORSERVICE

DIST_RELEASE=snapshots
PKG_PATH=$DIST_SERVER/$DIST_RELEASE/packages/`uname -m`/

SVN_EDITOR=vim
GIT_EDITOR=vim
CVSROOT=anoncvs@anoncvs.spacehopper.org:/cvs
export PATH HOME TERM PKG_PATH SVN_EDITOR CVS_ROOT GIT_EDITOR

case $TERM in
  xterm*)
    # Set xterm title to user@host: pwd
    # Set shell prompt to \a \$
    # (ASCII bell for xmobar's alerter, \$ is default prompt)
    PS1="]0;\u@\h: \w\a\\\$ "
    ;;
  *)
    ;;
esac


alias git=hub
