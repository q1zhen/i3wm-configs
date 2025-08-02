#!/usr/bin/env bash

if [[ -n $BLOCK_BUTTON ]]; then
	playerctl play-pause
fi

status=$(playerctl status 2>/dev/null)

if [[ -z "$status" ]]; then
	echo ""
fi

if [[ "$status" == "Playing" ]]; then
	symbol=""
else
	symbol=""
fi

echo "$symbol"
