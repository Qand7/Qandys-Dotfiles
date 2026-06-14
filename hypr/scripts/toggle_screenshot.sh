#!/bin/bash

screenshot="hyprshot"

if pgrep -f $screenshot > /dev/null; then
     pkill -f slurp
#     pkill -f $screenshot
else
	hyprshot --freeze --mode region --output $HOME/Pictures/Screenshots &
fi
