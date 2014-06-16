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

stalonetray &
nm-applet &

hostname -s > ~/public_html/where-in-labs
xmonad
echo -n > ~/public_html/where-in-labs
