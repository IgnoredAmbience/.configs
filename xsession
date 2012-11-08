if [ -d /etc/X11/xinit/xinitrc.d ] ; then
        for f in /etc/X11/xinit/xinitrc.d/* ; do
                [ -x "$f" ] && . "$f"
        done
        unset f
fi

. /etc/X11/xinit/xinitrc.d/pulseaudio

[ -f /etc/profile ] && . /etc/profile
PATH=~/bin:$PATH
eval `ssh-agent`
#xsetroot -solid black

feh --bg-scale ~/pictures/London-skynet.jpg &
xsnow -nosanta -notrees &
mpd &

# Recompile if required

if `ldd ~/.xmonad/xmonad-* | grep "not found" >/dev/null`
then
  echo "Deleting bad xmonad"
  rm ~/.xmonad/xmonad-*
fi

exec xmonad
