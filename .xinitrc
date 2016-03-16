#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

xrandr --output DVI-0 --left-of DVI-1
compton --config ~/rcfiles/compton.conf &

~/dropbox start &
xscreensaver -no-splash &
udiskie -2 -s -n &
# xbindkeys

systemctl start --user feh
# systemctl start --user updatecount

ibus-daemon &

start-pulseaudio-x11

xrdb ~/.Xresources

exec i3
