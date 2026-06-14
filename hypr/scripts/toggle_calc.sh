#!/bin/bash

calc="wofi-calc"

if pgrep -x $calc > /dev/null; then
	killall $calc
else
	$calc &
fi
