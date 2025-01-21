#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DIS_THRESHOLD=5 #real projects, it is usally 75

while IFS= read -r line # IFS, internal field separator, empty it will ignore while space. -r is for not to ignore special charecters like /
do
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$PARTITION is more than $DISK_THRESHOLD, current value: $USAGE. Please check"
    fi
done <<< $DISK_USAGE