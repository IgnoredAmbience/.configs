PATH=~/bin:$PATH
eval `ssh-agent`
#xsetroot -solid black
feh --bg-scale ~/pictures/London-skynet.jpg

# Recompile if required

if `ldd ~/.xmonad/xmonad-* | grep "not found" >/dev/null`
then
  echo "Deleting bad xmonad"
  rm ~/.xmonad/xmonad-*
fi

exec xmonad
