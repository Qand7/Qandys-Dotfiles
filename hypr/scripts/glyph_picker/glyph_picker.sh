#!/bin/bash

picker="wofi"

if pgrep -x $picker > /dev/null; then
	killall $picker
else
	cat "$HOME/.config/hypr/scripts/glyph_picker/nerdfont.txt" | wofi --dmenu  | awk '{print $1}' | wl-copy &
fi


