#!/bin/bash
SERVICE="nginx"
if pgrep -x "$SERVICE" >/dev/null
then
    echo "$SERVICE is running"
else
    echo "$SERVICE stopped"
    # uncomment to start nginx if stopped
    service nginx start
    # mail  
fi