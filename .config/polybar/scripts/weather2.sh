#!/usr/bin/env bash

# detect location from IP
location=$(curl -s --max-time 3 https://ipinfo.io/city)
region=$(curl -s --max-time 3 https://ipinfo.io/region)

# fallback if detection fails
if [ -z "$location" ]; then
    location="Unknown"
fi

# fetch weather
weather=$(curl -s --max-time 4 "https://wttr.in/${location}?format=%c+%t")

# output
echo "${weather}  ${location}, ${region}"
