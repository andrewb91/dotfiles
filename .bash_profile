# ~/.bash_profile

# i3 xorg
if [[ "$(tty)" = "/dev/tty1" ]]; then
pgrep i3 || startx ~/.config/X11/.xinitrc
fi

# Hyprland
#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec start-hyprland   # remove the exec to remain logged in when your wm ends
#fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
echo -n "somepass" | gnome-keyring-daemon --start --components=secrets,ssh
export SSH_AUTH_SOCK
eval `keychain --eval id_rsa`
