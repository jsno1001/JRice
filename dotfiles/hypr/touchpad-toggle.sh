#!/usr/bin/env bash

DEVICE="pnp0c50:0b-093a:0255-touchpad"
STATE_FILE="/tmp/touchpad_state"

# если файла нет — считаем что тачпад включён
CURRENT=$(cat "$STATE_FILE" 2>/dev/null || echo "1")

if [ "$CURRENT" = "1" ]; then
    hyprctl eval 'hl.device({name = "pnp0c50:0b-093a:0255-touchpad", enabled = false})'
    echo "0" > "$STATE_FILE"
    notify-send "Touchpad" "Disable"
else
    hyprctl eval 'hl.device({name = "pnp0c50:0b-093a:0255-touchpad", enabled = true})'
    echo "1" > "$STATE_FILE"
    notify-send "Touchpad" "Enable"
fi
