#!/bin/bash

PASS=$(apg -m 8 -n 1 -MNC -E 'O03')
USERNAME=roman
FILE=/home/ags/projects/linux-timeacc/${USERNAME}.limit

if [ ! -r $FILE ]; then
    exit 0
fi

RUN_BEFORE=$(date -r $FILE +%Y%m%d%H%M%S)
NOW=$(date +%Y%m%d%H%M%S)

if [ "$NOW" -gt "$RUN_BEFORE" ]; then
    echo Killing all processes for user $USERNAME
    echo NOW: $NOW
    echo RUN_BEFORE: $RUN_BEFORE
    pkill -u $USERNAME
fi

echo "${USERNAME}:${PASS}" | chpasswd -c MD5
sleep 10

