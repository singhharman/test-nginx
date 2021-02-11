#!/bin/bash
SERVICE="nginx"
if pgrep -x "$SERVICE" >/dev/null
then
    echo "$SERVICE is running"
else
    echo "$SERVICE stopped"
    # start nginx if stopped
    sudo service nginx start
fi