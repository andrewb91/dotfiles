# rr
# ~/.bash_profile
#
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx   # remove the exec to remain logged in when your wm ends
fi
#if [[ "$(tty)" = "/dev/tty1" ]]; then
#pgrep i3 || startx "XDG_CONFIG_HOME/X11/.xinitrc"
#fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
echo -n "somepass" | gnome-keyring-daemon --start --components=secrets,ssh
eval `keychain --eval id_rsa`

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[ -f /home/drew/.dart-cli-completion/bash-config.bash ] && . /home/drew/.dart-cli-completion/bash-config.bash || true
## [/Completion]
