#!/bin/bash

nmcli dev wifi rescan >/dev/null 2>&1 &

current=$(nmcli -t -f ACTIVE,SSID dev wifi | awk -F: '$1=="yes" {print $2}')

declare -A saved_map
while IFS=: read -r name type; do
  [ "$type" = "802-11-wireless" ] && saved_map["$name"]=1
done < <(nmcli -t -f NAME,TYPE connection show)

declare -A avail_map
while IFS=: read -r ssid signal; do
  [ -z "$ssid" ] && continue
  if [ -z "${avail_map[$ssid]}" ] || [ "$signal" -gt "${avail_map[$ssid]}" ]; then
    avail_map["$ssid"]="$signal"
  fi
done < <(nmcli -t -f SSID,SIGNAL dev wifi list)

choice=$(
{
  [ -n "$current" ] && echo "$current"

  for s in "${!saved_map[@]}"; do
    [ -n "${avail_map[$s]}" ] && [ "$s" != "$current" ] && echo "$s"
  done

  for ssid in "${!avail_map[@]}"; do
    [ -z "${saved_map[$ssid]}" ] && [ "$ssid" != "$current" ] && echo "$ssid"
  done
} | wofi --dmenu --prompt "Wi-Fi" --width 300 --height 400 --lines 10
)

[ -z "$choice" ] && exit 0

ssid="$choice"

# если сеть сохранена
if [ -n "${saved_map[$ssid]}" ]; then
  # сразу запрашиваем пароль (быстро, без ожиданий nmcli)
  password=$(wofi --dmenu --password --prompt "Password for $ssid" --width 300 --lines 1)
  [ -z "$password" ] && exit 0

  # пробуем подключиться
  nmcli connection modify "$ssid" wifi-sec.psk "$password"
  nmcli dev wifi connect "$ssid" password "$password"

else
  password=$(wofi --dmenu --password --prompt "Password for $ssid" --width 300 --lines 1)
  [ -z "$password" ] && exit 0

  nmcli dev wifi connect "$ssid" password "$password"
fi