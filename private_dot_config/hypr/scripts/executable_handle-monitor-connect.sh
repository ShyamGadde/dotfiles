#!/usr/bin/env bash

last_active_window_address=""

handle() {
    case $1 in
        activewindowv2*)
            last_active_window_address="${1##*>>}"
            ;;
        monitoraddedv2*)
            # for i in {1..10}; do
            #     hyprctl dispatch moveworkspacetomonitor "$i 1"
            # done

            hyprctl --batch "\
                dispatch moveworkspacetomonitor 1 1;\
                dispatch moveworkspacetomonitor 2 1;\
                dispatch moveworkspacetomonitor 3 1;\
                dispatch moveworkspacetomonitor 4 1;\
                dispatch moveworkspacetomonitor 5 1;\
                dispatch moveworkspacetomonitor 6 1;\
                dispatch moveworkspacetomonitor 7 1;\
                dispatch moveworkspacetomonitor 8 1;\
                dispatch moveworkspacetomonitor 9 1;\
                dispatch moveworkspacetomonitor 10 1"

            brightnessctl -s set 0
            ;;
        monitorremoved*)
            brightnessctl -r
            hyprctl dispatch focuswindow "address:0x$last_active_window_address"
            ;;
    esac
}

socat - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" | while read -r line; do handle "$line"; done
