#!/usr/bin/bash

terminator -e "$*; tput setaf 5 bold; read -p 'Press any key to exit!' -s -n 1"
