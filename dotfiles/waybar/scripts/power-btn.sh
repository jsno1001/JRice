#!/usr/bin/env bash

result=$(printf "󰐥 Poweroff\n󰜉 Reboot\n󰤄 Suspend\n󰍃 Log Out\n󰘚 UEFI settings\n󰚰 Update" | wofi --dmenu --width 500 --height 400 --prompt ". . .")

case "$result" in
    "󰐥 Poweroff")
        systemctl poweroff
        ;;
    "󰜉 Reboot")
        systemctl reboot
        ;;
    "󰍃 Log Out")
        loginctl terminate-session $XDG_SESSION_ID
        ;;
    "󰤄 Suspend")
        hyprlock &
        systemctl suspend
        ;;
    "󰘚 UEFI settings")
        systemctl reboot --firmware-setup
        ;;
    "󰚰 Update")
        PASSWORD=$(zenity --password --title="root password")
        if [ -z "$PASSWORD" ]; then
            exit 1
        fi 
        echo "$PASSWORD" | sudo -S kitty -e pacman -Syu --noconfirm

        #if zenity --question \
        #    --title="Restart t" \
        #    --text="Restart the computer in 30 seconds?" \
        #    --timeout=30 \
        #    --ok-label="Cancel" \
        #    --cancel-label="Reboot?"; then
        #    zenity --info --text="Canceled" --timeout=3
        #    exit 0
        #else
        #    exit_code=$?
        #    echo "$PASSWORD" | sudo -S reboot
        #fi
        ;;
    *)
        exit 0
        ;;
esac
