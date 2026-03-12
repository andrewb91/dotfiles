#
# ~/.bash_profile
#
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec I3   # remove the exec to remain logged in when your wm ends
#  exec start-hyprland
fi
#if [[ "$(tty)" = "/dev/tty1" ]]; then
#pgrep i3 || startx "XDG_CONFIG_HOME/X11/.xinitrc"
#fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
echo -n "somepass" | gnome-keyring-daemon --unlock
eval `keychain --eval id_rsa`
