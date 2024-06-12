#!/bin/sh

handle() {
	echo "$1"
	case $1 in
	monitoraddedv2*)
		hyprctl dispatch moveworkspacetomonitor "1 1"
		hyprctl dispatch moveworkspacetomonitor "2 1"
		hyprctl dispatch moveworkspacetomonitor "3 1"
		hyprctl dispatch moveworkspacetomonitor "4 1"
		hyprctl dispatch moveworkspacetomonitor "5 1"
		hyprctl dispatch moveworkspacetomonitor "6 1"
		hyprctl dispatch moveworkspacetomonitor "7 1"
		hyprctl dispatch moveworkspacetomonitor "8 1"
		hyprctl dispatch moveworkspacetomonitor "9 1"
		hyprctl dispatch moveworkspacetomonitor "10 0"

		brightnessctl -s set 0
		;;
	monitorremoved*)
		brightnessctl -r
		;;
	esac
}

socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" | while read -r line; do handle "$line"; done
