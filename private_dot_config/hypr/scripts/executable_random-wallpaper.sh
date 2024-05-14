#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
WALLPAPERS=($WALLPAPER_DIR/*)
TOTAL_WALLPAPERS=${#WALLPAPERS[@]}
RANDOM_NUM=$((RANDOM % TOTAL_WALLPAPERS))
RANDOM_WALLPAPER=${WALLPAPERS[$RANDOM_NUM]}

ln -sf $RANDOM_WALLPAPER $HOME/.cache/wallpaper.png

pkill swaybg
hyprctl dispatch -- exec swaybg --image $RANDOM_WALLPAPER --mode fill

pkill nwg-drawer
hyprctl dispatch -- exec "nwg-drawer -r -pbexit 'hyprctl dispatch exit; sleep 2' -pblock 'loginctl lock-session' -pbpoweroff 'systemctl poweroff' -pbreboot 'systemctl reboot' -pbsize 40"
