#!/usr/bin/env bash

STATE_FILE="/tmp/waybar_mode"

HORIZONTAL_CONFIG="$HOME/.config/waybar/horizontal/config.jsonc"
HORIZONTAL_STYLE="$HOME/.config/waybar/horizontal/style.css"

WORK_CONFIG="$HOME/.config/waybar/work-only/config.jsonc"
WORK_STYLE="$HOME/.config/waybar/work-only/style.css"

spawn_regular_bar() {
    waybar &
}

spawn_horizontal() {
    waybar -c "$HORIZONTAL_CONFIG" -s "$HORIZONTAL_STYLE" &
}

spawn_workspaces() {
    waybar -c "$WORK_CONFIG" -s "$WORK_STYLE" &
}

switch_to() {
    pkill -x waybar
    while pgrep -x waybar >/dev/null; do sleep 0.1; done

    case "$1" in
    regular)
        spawn_regular_bar
        echo "regular" >"$STATE_FILE"
        ;;
    horizontal)
        spawn_horizontal
        echo "horizontal" >"$STATE_FILE"
        ;;
    work)
        spawn_workspaces
        echo "work" >"$STATE_FILE"
        ;;
    esac
}

case "$1" in
"regular" | "work" | "horizontal")
    switch_to "$1"
    ;;
"toggle")
    if [[ -f "$STATE_FILE" ]]; then
        current=$(cat "$STATE_FILE")
    else
        current="regular"
    fi

    if [[ "$current" == "regular" ]]; then
        switch_to horizontal
    elif [[ "$current" == "horizontal" ]]; then
        switch_to work
    else
        switch_to regular
    fi
    ;;
*)
    echo "usage: $0 {regular|horizontal|work|toggle}"
    ;;
esac
