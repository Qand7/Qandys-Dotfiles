#!/bin/bash

clrpkr="hyprpicker"

if pgrep -x $clrpkr > /dev/null; then
	killall $clrpkr
else
	$clrpkr -a -b -f rgb &
fi
