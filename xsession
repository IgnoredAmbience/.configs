if [ -d /etc/X11/xinit/xinitrc.d ] ; then
        for f in /etc/X11/xinit/xinitrc.d/* ; do
                [ -x "$f" ] && . "$f"
        done
        unset f
fi

[ -f ~/.Xkeymap ] && xkbcomp ~/.Xkeymap $DISPLAY

[ -f /etc/profile ] && . /etc/profile

PATH=~/bin:$PATH

#xsetroot -solid black

feh --bg-scale ~/pictures/London-skynet.jpg &

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

stalonetray &
xscreensaver -no-splash &

# Recompile if required
if `ldd ~/.xmonad/xmonad-* | grep "not found" >/dev/null`
then
  echo "Deleting bad xmonad"
  rm ~/.xmonad/xmonad-*
fi

export LIBOVERLAY_SCROLLBAR=0
export SWT_GTK3=0

exec xmonad
