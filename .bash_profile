# ~/.bash_profile

if [[ -z $DISPLAY && -z $WAYLAND_DISPLAY && $(tty) == /dev/tty1 ]]; then
    choice=$(printf 'Hyprland\ni3\n' | fzf --prompt='Session: ' --layout=reverse)

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

    case "$choice" in
        Hyprland)
            exec start-hyprland -- --config ~/.config/hypr/hyprland.lua
            ;;
        i3)
            exec startx
            ;;
    esac
fi
