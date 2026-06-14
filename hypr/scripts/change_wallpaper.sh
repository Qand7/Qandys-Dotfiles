#!/bin/bash

ln -sf "$1" "$HOME/.config/hypr/colorscheme/wallpaper.png"

$HOME/.config/hypr/scripts/wallpaper_refresh.sh

wallpaper_path=$(readlink -f $HOME/.config/hypr/colorscheme/wallpaper.png)
notify-send -i "$wallpaper_path" "Wallpaper Changed to:" "<b>$wallpaper_path</b>"
