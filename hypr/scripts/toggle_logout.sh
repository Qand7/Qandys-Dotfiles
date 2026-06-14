#!/bin/bash

logout="wlogout"
arg1="-b 4"
arg2="-L 100"
arg3="-R 100"
arg4="-T 270"
arg5="-B 270"
arg6="-c 10"

if pgrep -x "$logout" > /dev/null; then
	killall "$logout"
else
	"$logout" "$arg1" "$arg2" "$arg3" "$arg4" "$arg5" "$arg6" &
fi
