#!/bin/bash

# CONFIG
TERMINAL="alacritty"
EDITOR="nvim"
BROWSER="brave"
MANAGER="thunar"

hyprctl dispatch workspace 1

$BROWSER --new-window

sleep 2

$MANAGER 

sleep 1

$EDITOR

