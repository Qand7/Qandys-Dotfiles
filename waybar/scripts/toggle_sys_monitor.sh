#!/bin/bash

monitor="htop"

if pgrep -x $monitor > /dev/null; then
	killall $monitor
else
	kitty $monitor &
fi
