#!/bin/sh

# Conf X
/usr/bin/xrdb -merge ~/.Xresources &
# Hide cursor
/usr/bin/unclutter &
# Pulse Audio shit
/usr/bin/start-pulseaudio-x11 &
# auto lock screen
/usr/bin/xautolock -time 5 -lockdelay 180 &
# copy paste between buffer & clipboard
/usr/bin/autocutsel -fork &
/usr/bin/autocutsel -selection PRIMARY -fork &
# Show nice wallpaper from unsplash
feh --bg-scale /home/poulp/pics/wallpaper/current &
exec /usr/bin/i3 > /tmp/i3.log 2>/tmp/i3.error.log
