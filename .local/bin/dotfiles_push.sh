#!/bin/bash
dotfiles add .bashrc .bash_profile .themes .xinitrc .local/bin .config/alacritty .config/i3 .config/nvim .config/polybar .config/rofi .config/sxhkd .config/picom.conf .config/redshift.conf
dotfiles commit -m "Latest commit"
dotfiles push

