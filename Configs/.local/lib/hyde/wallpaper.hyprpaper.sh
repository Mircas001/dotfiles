#!/usr/bin/env bash
# A backend for hyprpaper
# * Notes
# For future backends, this can be used as a base, just
# change the hyprctl commands for the desired backend's commands

# shellcheck source=$HOME/.local/bin/hyde-shell
# shellcheck disable=SC1091
if ! source "$(which hyde-shell)"; then
    echo "[wallbash] code :: Error: hyde-shell not found."
    echo "[wallbash] code :: Is HyDE installed?"
    exit 1
fi

selected_wall="${1:-${XDG_CACHE_HOME:-$HOME/.cache}/hyde/wall.set}"
[ -z "${selected_wall}" ] && echo "No input wallpaper" && exit 1
selected_wall="$(readlink -f "${selected_wall}")"

hyprctl hyprpaper preload "${selected_wall}"
hyprctl hyprpaper wallpaper ",${selected_wall}"