#!/bin/bash

taskbar="waybar"

if pgrep -x $taskbar > /dev/null; then
	killall $taskbar
else
	$taskbar &
fi
