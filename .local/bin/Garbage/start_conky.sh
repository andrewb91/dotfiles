#!/bin/bash
sleep 2
if pidof conky | grep [0-0] > /dev/null
then
exec killall conky
else
exec conky
fi
