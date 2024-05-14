#!/bin/sh

handle() {
  case $1 in monitoradded*)
    hyprctl dispatch moveworkspacetomonitor "1 0"
    hyprctl dispatch moveworkspacetomonitor "2 0"
    hyprctl dispatch moveworkspacetomonitor "3 0"
    hyprctl dispatch moveworkspacetomonitor "4 0"
    hyprctl dispatch moveworkspacetomonitor "5 0"
    hyprctl dispatch moveworkspacetomonitor "6 1"
    hyprctl dispatch moveworkspacetomonitor "7 1"
    hyprctl dispatch moveworkspacetomonitor "8 1"
    hyprctl dispatch moveworkspacetomonitor "9 1"
    hyprctl dispatch moveworkspacetomonitor "10 1"
  esac
}

socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" | while read -r line; do handle "$line"; done
