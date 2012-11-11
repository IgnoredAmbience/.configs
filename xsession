. /etc/X11/xinit/xinitrc.d/pulseaudio

[ -f /etc/profile ] && . /etc/profile

PATH=~/bin:$PATH

eval `ssh-agent`
#xsetroot -solid black

feh --bg-scale ~/pictures/London-skynet.jpg &

# These should really be on the login shell...
mpd &
pidof mpdscribble >& /dev/null
if [ $? -ne 0 ]; then
  mpdscribble &
fi

xsnow -nosanta -notrees &
mpd &

# Recompile if required

if `ldd ~/.xmonad/xmonad-* | grep "not found" >/dev/null`
then
  echo "Deleting bad xmonad"
  rm ~/.xmonad/xmonad-*
fi

exec xmonad
