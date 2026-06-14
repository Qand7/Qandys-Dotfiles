#!/bin/bash

menu="wofi"

if pgrep -x $menu > /dev/null; then
	killall $menu
else
	$menu &
fi
