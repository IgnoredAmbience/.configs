PATH=~/bin:$PATH
eval `ssh-agent`
#xsetroot -solid black
feh --bg-scale ~/pictures/London-skynet.jpg
/usr/lib/notification-daemon-1.0/notification-daemon &
exec xmonad

