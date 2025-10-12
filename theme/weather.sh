#!/usr/bin/env bash

plugin_weather_location="Buenos Aires, Argentina"
plugin_weather_format_string="%t+H:%h"

function load_plugin() {
	if ! command -v jq &>/dev/null; then
		exit 1
	fi
    if [[ -n "$plugin_weather_location" ]]; then
        LOCATION="$plugin_weather_location"
    else
        LOCATION=$(curl -s http://ip-api.com/json | jq -r '"\(.city), \(.country)"' 2>/dev/null)
    fi
    WEATHER=$(curl -sL wttr.in/"${LOCATION// /%20}"\?format="${plugin_weather_format_string}" 2>/dev/null)
	echo "${WEATHER}"
	echo "${WEATHER}" >> /weather.log
}

load_plugin
