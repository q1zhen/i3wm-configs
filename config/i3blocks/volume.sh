#!/usr/bin/env bash

# Perform click‐actions first (if any)
case "$BLOCK_BUTTON" in
	1)
		pactl set-sink-mute @DEFAULT_SINK@ toggle
		;;
	3)
		cinnamon-settings sound >/dev/null &
		disown
		;;
	4)
		pactl set-sink-volume @DEFAULT_SINK@ +5%
		;;
	5)
		pactl set-sink-volume @DEFAULT_SINK@ -5%
		;;
	*)
		;;
esac

line=$(amixer get Master | grep -m1 '%')

# extract the volume number (e.g. “74” from “[74%]”)
vol=$(echo "$line" | cut -d'[' -f2 | cut -d'%' -f1)

# extract the mute state (e.g. “off” from “[off]”)
mute=$(echo "$line" | cut -d'[' -f3 | cut -d']' -f1)

echo $vol%
echo $vol%

if [[ "$mute" == "off" ]] || [[ "$vol" -eq 0 ]]; then
	echo '#9399b2'
elif (( 30 < vol && vol <= 60 )); then
	echo '#f9e2af'
elif (( vol > 60 )); then
	echo '#fab387'
	if (( vol >= 100 )); then
		pactl set-sink-volume @DEFAULT_SINK@ 100%
	fi
fi
