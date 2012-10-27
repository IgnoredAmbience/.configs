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
mpd &
/usr/lib/notification-daemon-1.0/notification-daemon &
xsnow -nosanta -notrees &
exec xmonad
