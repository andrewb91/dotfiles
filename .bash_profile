# ~/.bash_profile
#
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx   # remove the exec to remain logged in when your wm ends
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
echo -n "somepass" | gnome-keyring-daemon --start --components=secrets,ssh
eval `keychain --eval id_rsa`
