#!/bin/bash

if ! command -v playerctl &> /dev/null; then
	echo "#[fg=red]♪ playerctl is not installed#[default]"
	exit 0
fi

IFS='
'

list=$(playerctl -a metadata -f "{{title}} - {{artist}} ({{status}})")
last_playing=$(cat ~/.config/tmux/last_playing)

output=""
found=false
for player in $list; do
	if [[ $found == "true" ]]; then
		break
	fi
	
	if [[ "$player" =~ .*"(Playing)" ]]; then
		output=${player::-10}
		found=true
	fi
done

if [[ $found == "false" ]]; then
	for player in $list; do
		if [[ $found == "true" ]]; then
			break
		fi
		
		if [[ "$player" =~ .*"(Paused)" ]]; then
			output=${player::-9}
			if [[ $output == $last_playing ]]; then
				found=true
			fi
		fi
	done
fi

if [[ $found == "false" ]]; then
	exit 0
fi

if [[ "${output: -3}" == " - " ]]; then
	output=${output::-3}
fi

if [[ $output != $last_playing ]]; then
	echo -n $output > ~/.config/tmux/last_playing
fi

if [[ ${#output} -ge 40 ]]; then
	output="${output::40}\u2026"
fi

echo -e "♪" $output
