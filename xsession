#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
        for f in /etc/X11/xinit/xinitrc.d/* ; do
                [ -x "$f" ] && . "$f"
        done
        unset f
fi

[ -f /etc/profile ] && . /etc/profile

PATH=~/bin:~/.cabal/bin:$PATH

eval `ssh-agent`
#xsetroot -solid black

feh --bg-scale ~/pictures/London-skynet.jpg &

# These should really be on the login shell...
mpd &
mpdscribble &

# Recompile if required
if `ldd ~/.xmonad/xmonad-* | grep "not found" >/dev/null`
then
  echo "Deleting bad xmonad"
  rm ~/.xmonad/xmonad-*
fi

export LIBOVERLAY_SCROLLBAR=0
export SWT_GTK3=0

stalonetray &
nm-applet &
xscreensaver -no-splash &

exec xmonad
