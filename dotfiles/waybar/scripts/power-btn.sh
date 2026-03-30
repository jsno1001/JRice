result=$(echo -e "Poweroff \nReboot \nWiFi \n" | wofi --dmenu --width 500 --height 400)
if [ $result == "Poweroff" ]; then
    poweroff
elif [ $result == "Reboot" ]; then
    reboot
elif [ $result == "WiFi" ]; then
    /home/jsno/.config/waybar/scripts/wifi.sh
fi