#!/bin/bash

chosen=$(echo -e "Shutdown\nReboot\nLogout" | rofi -dmenu -i -p "Power Menu: ")

case "$chosen" in
    Shutdown) systemctl poweroff ;;
    Reboot) systemctl reboot ;;
    Logout) i3-msg exit ;;
    *) ;;
esac

